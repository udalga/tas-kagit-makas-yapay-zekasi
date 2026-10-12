#!/usr/bin/env bash
# index.html (artifact kaynağı, iskeletsiz) -> docs/index.html (GitHub Pages için tam HTML belgesi)
set -euo pipefail
cd "$(dirname "$0")"

src=index.html
out=docs/index.html
mkdir -p docs

# Başlık, font ve stil kısmı <head>'e; <div class="wrap"> ve sonrası <body>'ye
split=$(grep -n '^<div class="wrap">' "$src" | head -1 | cut -d: -f1)
if [ -z "$split" ]; then echo "Bölme noktası bulunamadı" >&2; exit 1; fi

{
  echo '<!doctype html>'
  echo '<html lang="tr">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="description" content="TÜBİTAK 4006-A Bilim Fuarı projesi: oyuncunun hamle desenlerini okuyup ona karşı oynayan taş kağıt makas yapay zekâsı. Umut Dalga, Ruhi Emre Karaman · Danışman: Mehmet Akbaş">'
  echo '<meta name="theme-color" content="#0F1525">'
  echo '<meta name="mobile-web-app-capable" content="yes">'
  echo '<meta name="apple-mobile-web-app-capable" content="yes">'
  echo '<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22%3E%3Crect width=%22100%22 height=%22100%22 rx=%2224%22 fill=%22%230F1525%22/%3E%3Ctext x=%2250%22 y=%2266%22 font-size=%2252%22 text-anchor=%22middle%22%3E%E2%9C%8A%3C/text%3E%3C/svg%3E">'
  echo '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}img{max-width:100%}</style>'
  head -n $((split - 1)) "$src" | grep -v '^<meta charset='
  echo '</head>'
  echo '<body>'
  tail -n +"$split" "$src"
  echo '</body>'
  echo '</html>'
} > "$out"

touch docs/.nojekyll
echo "Oluşturuldu: $out"
