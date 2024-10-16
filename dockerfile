# Use uma imagem base mínima
FROM python:3.8-alpine

# Instalar dependências
RUN apk --no-cache add build-base

# Adicionar um usuário não privilegiado
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copiar o código da aplicação
WORKDIR /app
COPY . .

# Definir permissões
RUN chown -R appuser:appgroup /app

# Trocar para o usuário não privilegiado
USER appuser

# Comando para rodar a aplicação (pode ser o seu script ou uma aplicação Python)
CMD ["python", "hello.py"]
