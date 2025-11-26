FROM php:8.2-apache

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy project files to container
COPY . /var/www/html/

# Expose port 3000
EXPOSE 3000

# Change default Apache port to Railway port
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf

CMD ["apache2-foreground"]
