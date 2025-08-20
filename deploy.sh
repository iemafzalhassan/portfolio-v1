#!/bin/bash

# Enhanced Deploy script for Hugo portfolio with DevOps best practices
# Author: Afzal Hassan
# Version: 2.0

set -e  # Exit on any error

# Configuration
SLACK_WEBHOOK="${SLACK_WEBHOOK_URL:-}"
SITE_URL="https://portfolio.iemafzalhassan.in/"
DEPLOY_START_TIME=$(date +%s)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to send Slack notification
send_slack_notification() {
    local message="$1"
    local color="$2"
    local status="$3"
    
    local payload=$(cat <<EOF
{
    "attachments": [
        {
            "color": "$color",
            "title": "Portfolio Deployment $status",
            "text": "$message",
            "fields": [
                {
                    "title": "Site URL",
                    "value": "$SITE_URL",
                    "short": true
                },
                {
                    "title": "Timestamp",
                    "value": "$(date)",
                    "short": true
                }
            ],
            "footer": "DevOps Pipeline",
            "footer_icon": "https://platform.slack-edge.com/img/default_application_icon.png"
        }
    ]
}
EOF
)
    
    curl -X POST -H 'Content-type: application/json' \
         --data "$payload" \
         "$SLACK_WEBHOOK" >/dev/null 2>&1
}

# Function for logging with colors
log() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    case $level in
        "INFO")
            echo -e "${BLUE}[$timestamp] INFO:${NC} $message"
            ;;
        "SUCCESS")
            echo -e "${GREEN}[$timestamp] SUCCESS:${NC} $message"
            ;;
        "WARNING")
            echo -e "${YELLOW}[$timestamp] WARNING:${NC} $message"
            ;;
        "ERROR")
            echo -e "${RED}[$timestamp] ERROR:${NC} $message"
            ;;
    esac
}

# Function to run pre-deployment checks
run_pre_checks() {
    log "INFO" "Running pre-deployment checks..."
    
    # Check if Hugo is installed
    if ! command -v hugo &> /dev/null; then
        log "ERROR" "Hugo is not installed or not in PATH"
        return 1
    fi
    
    # Check Hugo version
    local hugo_version=$(hugo version | head -1)
    log "INFO" "Hugo version: $hugo_version"
    
    # Check if git is clean (optional warning)
    if ! git diff-index --quiet HEAD --; then
        log "WARNING" "Working directory has uncommitted changes"
    fi
    
    # Validate configuration
    if [ ! -f "hugo.toml" ]; then
        log "ERROR" "hugo.toml configuration file not found"
        return 1
    fi
    
    # Check if public directory exists and is a git repository (or submodule)
    if [ ! -d "public" ]; then
        log "ERROR" "public directory does not exist"
        return 1
    fi
    
    # Check if it's a git repository or submodule
    if [ ! -f "public/.git" ] && [ ! -d "public/.git" ]; then
        log "ERROR" "public directory is not a git repository (submodule not initialized?)"
        log "INFO" "Run: git submodule update --init --recursive"
        return 1
    fi
    
    log "SUCCESS" "Pre-deployment checks passed"
    return 0
}

# Function to build site
build_site() {
    log "INFO" "Building Hugo site..."
    
    # Clean previous build
    rm -rf public/* 2>/dev/null || true
    
    # Build with minification
    if hugo --minify --cleanDestinationDir; then
        log "SUCCESS" "Site built successfully"
        return 0
    else
        log "ERROR" "Hugo build failed"
        return 1
    fi
}

# Function to deploy site
deploy_site() {
    log "INFO" "Deploying to GitHub Pages..."
    
    cd public
    
    # Check if there are changes to deploy
    if git diff --quiet && git diff --cached --quiet; then
        log "WARNING" "No changes to deploy"
        cd ..
        return 0
    fi
    
    # Add all changes
    git add .
    
    # Create commit with detailed message
    local commit_msg="Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$commit_msg"
    
    # Push to GitHub Pages
    if git push origin main; then
        cd ..
        log "SUCCESS" "Deployment completed successfully"
        return 0
    else
        cd ..
        log "ERROR" "Failed to push to GitHub Pages"
        return 1
    fi
}

# Function to calculate deployment time
calculate_deploy_time() {
    local end_time=$(date +%s)
    local deploy_time=$((end_time - DEPLOY_START_TIME))
    echo "$deploy_time"
}

# Main deployment function
main() {
    log "INFO" "Starting portfolio deployment..."
    
    # Send start notification (only if webhook is configured)
    if [ -n "$SLACK_WEBHOOK" ]; then
        send_slack_notification "🚀 Starting portfolio deployment..." "warning" "Started"
    fi
    
    # Run pre-checks
    if ! run_pre_checks; then
        log "ERROR" "Pre-deployment checks failed"
        if [ -n "$SLACK_WEBHOOK" ]; then
            send_slack_notification "❌ Pre-deployment checks failed. Deployment aborted." "danger" "Failed"
        fi
        exit 1
    fi
    
    # Build site
    if ! build_site; then
        log "ERROR" "Site build failed"
        if [ -n "$SLACK_WEBHOOK" ]; then
            send_slack_notification "❌ Site build failed. Check Hugo configuration and content." "danger" "Failed"
        fi
        exit 1
    fi
    
    # Deploy site
    if ! deploy_site; then
        log "ERROR" "Deployment failed"
        if [ -n "$SLACK_WEBHOOK" ]; then
            send_slack_notification "❌ Deployment to GitHub Pages failed. Check repository permissions." "danger" "Failed"
        fi
        exit 1
    fi
    
    # Calculate deployment time
    local deploy_time=$(calculate_deploy_time)
    
    # Success notification
    local success_message="✅ Portfolio deployed successfully in ${deploy_time}s! Site is live at $SITE_URL"
    log "SUCCESS" "$success_message"
    if [ -n "$SLACK_WEBHOOK" ]; then
        send_slack_notification "$success_message" "good" "Successful"
    fi
    
    log "INFO" "Deployment pipeline completed!"
}

# Trap errors and send failure notification
trap 'if [ -n "$SLACK_WEBHOOK" ]; then send_slack_notification "❌ Deployment failed with error. Check logs for details." "danger" "Failed"; fi' ERR

# Run main function
main "$@"
