# =============================================================================
# Dockerfile for BioVanta Presentations (DevOps 101 Workshop)
# Serves static HTML presentations using Nginx
# =============================================================================

FROM nginx:1.27-alpine

LABEL maintainer="BioVanta Team"
LABEL description="DevOps 101 Workshop - HTML Presentation Server"

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy presentation files
COPY power-point/ /usr/share/nginx/html/
# COPY note.html /usr/share/nginx/html/note.html

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -q --spider http://localhost/ || exit 1

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
