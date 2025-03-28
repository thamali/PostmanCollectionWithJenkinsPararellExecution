FROM node:20


WORKDIR /app


RUN npm install -g newman


RUN npm install -g newman-reporter-html


RUN npm install -g newman-reporter-htmlextra


COPY GoRestAPIWorkflowCollection.json .
COPY GoRestEnv.json .


CMD ["newman", "run", "GoRestAPIWorkflowCollection.json", "-e", "GoRestEnv.json", "-r", "cli,json,html,htmlextra"]
