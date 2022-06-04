# Python Docker Starter

This is a boilerplate for starting a cron scheduled python script at certain intervals.

1. Copy project.

2. Edit /app and especially main.py in that folder. All prints will be logged to /var/log/cron.log and printed to logging in Docker.

3. Edit cronjob to suit your run schedule

4. Run `pip freeze -l > requirements.txt` to make sure that all pip requirements are being installed.

5. Optional: Edit Dockerfile to install any external applications or system features that you need.

6. Create an .env file for your configurable variables (or set them when running the container).