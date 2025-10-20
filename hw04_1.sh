#!/bin/bash


# Масив сайтів для перевірки
websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
  "https://nonexistent.example.com"
)

# Назва файлу логів
log_file="website_status.log"

# Очищуємо старий файл логів, якщо існує
> "$log_file"

echo "🔍 Початок перевірки сайтів..."
echo "==============================="

# Проходимо по кожному сайту у списку
for site in "${websites[@]}"; do
  # Отримуємо HTTP статус-код (переадресації обробляються -L)
  status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")

  # Перевірка, чи сайт доступний
  if [ "$status_code" -eq 200 ]; then
    echo "$site is UP"
    echo "$site is UP" >> "$log_file"
  else
    echo "$site is DOWN (status: $status_code)"
    echo "$site is DOWN (status: $status_code)" >> "$log_file"
  fi
done

echo "==============================="
echo " Результати записано у файл: $log_file"