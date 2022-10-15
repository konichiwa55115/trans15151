FROM bipinkrish/file-converter:latest

RUN apt install curl -y
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN apt-get update
RUN apt-get install -y cargo clang-format powershell z3 clang

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3","main.py"]
