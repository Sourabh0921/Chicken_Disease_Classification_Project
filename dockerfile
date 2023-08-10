FROM python:3.8-slim-buster

EXPOSE 8501
WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt

CMD streamlit run app.py