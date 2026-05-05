#!/bin/bash
# ═══════════════════════════════════════════════════════════
# Script para copiar as imagens geradas por IA para assets
# Execute no Terminal NATIVO (não no Gemini sandbox):
#   bash ~/central_ia/bilhon-os/landing-saude-tigela/copy-images.sh
# ═══════════════════════════════════════════════════════════

ASSETS="$HOME/central_ia/bilhon-os/landing-saude-tigela/assets"
BRAIN1="$HOME/.gemini/antigravity/brain/062a82aa-0061-41fa-993e-7cda38d31cb5"
BRAIN2="$HOME/.gemini/antigravity/brain/e1d93c79-177e-4a65-a188-605be6f64390"

echo "🔄 Copiando imagens para $ASSETS ..."
echo ""

# Hero Bowl — tentativa de todas as sessões
if cp "$BRAIN1/saude_hero_bowl_1777723345617.png" "$ASSETS/hero-bowl.png" 2>/dev/null || \
   cp "$BRAIN1/hero_bowl_photo_1777692718422.png" "$ASSETS/hero-bowl.png" 2>/dev/null || \
   cp "$BRAIN2/hero_bowl_photo_1777677943306.png" "$ASSETS/hero-bowl.png" 2>/dev/null; then
  echo "✅ hero-bowl.png"
else
  echo "❌ hero-bowl.png — nenhuma imagem encontrada"
fi

# Expert Portrait
if cp "$BRAIN1/expert_portrait_1777692731051.png" "$ASSETS/expert-photo.png" 2>/dev/null || \
   cp "$BRAIN2/expert_photo_1777677956581.png" "$ASSETS/expert-photo.png" 2>/dev/null; then
  echo "✅ expert-photo.png"
else
  echo "❌ expert-photo.png — nenhuma imagem encontrada"
fi

# Ebook Mockup
if cp "$BRAIN1/ebook_mockup_1777692744842.png" "$ASSETS/ebook-mockup.png" 2>/dev/null || \
   cp "$BRAIN2/ebook_mockup_3d_1777677967826.png" "$ASSETS/ebook-mockup.png" 2>/dev/null; then
  echo "✅ ebook-mockup.png"
else
  echo "❌ ebook-mockup.png — nenhuma imagem encontrada"
fi

echo ""
echo "📦 Conteúdo final:"
ls -lh "$ASSETS"
