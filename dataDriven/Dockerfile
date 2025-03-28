FROM node:20


WORKDIR /app


RUN npm install -g newman


RUN npm install -g newman-reporter-html


RUN npm install -g newman-reporter-htmlextra

#Ensure the results directory exists
RUN mkdir -p /app/results

COPY DataDrivenCollection.json /app/
COPY GoRestEnv.json /app/
COPY myuser.csv /app/


CMD ["newman", "run", "DataDrivenCollection.json", "-e", "GoRestEnv.json", "-d", "myuser.csv", "-r", "cli,json,html,htmlextra" , "--reporter-htmlextra-export", "/app/results/gorest.html"]
