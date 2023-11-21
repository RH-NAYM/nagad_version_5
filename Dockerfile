# Dockerfile, Image, Container

FROM python:3.10

RUN git clone https://github.com/RH-NAYM/nagad_version_5.git
RUN cd nagad_version_5 
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install fastapi uvicorn pydantic pytz
RUN wget "https://nagad-pulse.sgp1.digitaloceanspaces.com/nagad_AI_version5.zip"
RUN unzip "nagad_AI_version5.zip"
ADD nagad_main_API.py .

CMD [ "python", "./nagad_main_API.py" ]