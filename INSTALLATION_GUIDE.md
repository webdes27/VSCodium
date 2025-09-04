# VSCodium - Руководство по установке и использованию

## Обзор проекта
VSCodium - это кастомизированная версия Visual Studio Code, собранная из исходного кода Microsoft VS Code с возможностью создания собственных установщиков.

## Системные требования

### Обязательные компоненты:
- **Node.js**: v22.18.0+ (обязательно!)
- **Python**: 3.10.x или 3.11.x
- **Visual Studio 2022**: с компонентами "Spectre-mitigated libs"
- **Git**: для клонирования репозитория
- **Windows 10/11**: x64 архитектура

### Проверка версий:
```powershell
node --version    # Должно быть v22.18.0+
python --version  # Должно быть 3.10.x или 3.11.x
```

## Установка и сборка

### 1. Клонирование репозитория
```bash
git clone https://github.com/webdes27/VSCodium.git
cd VSCodium
```

### 2. Установка зависимостей
```bash
npm install
```
**Важно**: Если возникают ошибки с правами доступа, запустите PowerShell от имени администратора.

### 3. Сборка проекта
```bash
# Полная сборка
npm run compile

# Или в режиме наблюдения (для разработки)
npm run watch
```

### 4. Запуск приложения
```bash
# Через официальный скрипт
.\scripts\code.bat

# Или напрямую через Electron
npx electron .\out\main.js
```

## Создание установщика

### 1. Сборка для Windows x64
```bash
npx gulp vscode-win32-x64
```

### 2. Создание системного установщика
```bash
npx gulp vscode-win32-x64-system-setup
```

### 3. Создание пользовательского установщика
```bash
npx gulp vscode-win32-x64-user-setup
```

**Результат**: Установщик будет создан в папке `.build\win32-x64\system-setup\VSCodeSetup.exe`

## Структура проекта

```
VSCodium/
├── src/                    # Исходный код VS Code
├── build/                  # Скрипты сборки
├── scripts/               # Скрипты запуска
├── .build/                # Результаты сборки (исключено из Git)
├── out/                   # Скомпилированный код (исключено из Git)
├── node_modules/          # Зависимости (исключено из Git)
├── package.json           # Конфигурация проекта
├── product.json           # Настройки продукта
└── .gitignore            # Исключения для Git
```

## Возможные проблемы и решения

### Ошибка MSB8040 (Spectre mitigations)
**Проблема**: `error MSB8040: для этого проекта требуются библиотеки с устранением рисков Spectre`
**Решение**: Установите "Spectre-mitigated libs" в Visual Studio Installer

### Ошибка прав доступа
**Проблема**: `PermissionError: [Errno 13] Permission denied`
**Решение**: Запустите PowerShell от имени администратора

### Неправильная версия Node.js
**Проблема**: `Please use Node.js v22.15.1 or later`
**Решение**: Установите Node.js v22.18.0+ и убедитесь, что он в PATH

### Приложение не запускается
**Проблема**: Процесс запущен, но окно не появляется
**Решение**: 
1. Проверьте панель задач Windows
2. Попробуйте Alt+Tab
3. Перезапустите через `.\scripts\code.bat`

## Разработка

### Режим наблюдения
```bash
npm run watch
```
Автоматически пересобирает проект при изменении файлов.

### Отладка
```bash
# Запуск с отладкой
.\scripts\code.bat --inspect

# Запуск с дополнительными флагами
.\scripts\code.bat --disable-extensions --verbose
```

## Публикация

### Загрузка на GitHub
```bash
git add .
git commit -m "Описание изменений"
git push origin main
```

**Важно**: Папки `.build`, `out`, `node_modules` автоматически исключены из Git через `.gitignore`.

## Контакты и поддержка

- **Репозиторий**: https://github.com/webdes27/VSCodium.git
- **Основан на**: Microsoft Visual Studio Code v1.104.0
- **Лицензия**: MIT

---

*Последнее обновление: $(Get-Date -Format "yyyy-MM-dd")*
