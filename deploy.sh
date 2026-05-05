#!/bin/bash
# ==============================================
# 🚀 Deploy Rápido — Saúde na Tigela
# Execute: bash deploy.sh
# ==============================================

echo "🚀 Iniciando deploy da landing page..."
echo ""

# Diretório fonte
SRC="/Users/Gustavo/central_ia/bilhon-os/landing-saude-tigela"

# Clonar o repo existente
cd /tmp
rm -rf saude-deploy
git clone https://github.com/ogustavopecanha/saude-na-tigela-app.git saude-deploy

if [ $? -ne 0 ]; then
  echo "❌ Erro ao clonar repositório. Verifique sua conexão."
  exit 1
fi

cd saude-deploy

# Copiar todos os arquivos da landing page
cp "$SRC/index.html" .
cp "$SRC/style.css" .
cp "$SRC/script.js" .
cp "$SRC/obrigado.html" .
mkdir -p assets
cp "$SRC/assets/hero-bowl.png" assets/
cp "$SRC/assets/expert-photo.png" assets/
cp "$SRC/assets/ebook-mockup.png" assets/
cp "$SRC/assets/hero-bowl.svg" assets/
cp "$SRC/assets/expert.svg" assets/
cp "$SRC/assets/ebook.svg" assets/

# Remover test.js criado anteriormente
rm -f test.js

echo "📦 Arquivos copiados. Fazendo commit..."

git add -A
git commit -m "🚀 Landing Page Saúde na Tigela - deploy completo com checkout Kiwify"
git push origin main

if [ $? -eq 0 ]; then
  echo ""
  echo "✅ DEPLOY CONCLUÍDO!"
  echo ""
  echo "🌐 Sua landing page estará disponível em:"
  echo "   https://ogustavopecanha.github.io/saude-na-tigela-app/"
  echo ""
  echo "⏳ O GitHub Pages pode levar 1-2 minutos para atualizar."
  echo "   Verifique em: https://github.com/ogustavopecanha/saude-na-tigela-app/settings/pages"
  echo ""
  echo "💡 Para conectar ao domínio saudenatigela.com.br:"
  echo "   1. Vá em Settings > Pages no repositório"
  echo "   2. Em 'Custom domain', digite: saudenatigela.com.br"
  echo "   3. No Registro.br, crie um CNAME apontando para: ogustavopecanha.github.io"
else
  echo "❌ Erro no push. Verifique suas credenciais do GitHub."
fi

# Limpeza
cd /tmp
rm -rf saude-deploy
