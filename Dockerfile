FROM python:latest
RUN adduser appuser
USER appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
WORKDIR /home/appuser
COPY --chown=appuser:appuser requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY --chown=appuser:appuser . .
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
