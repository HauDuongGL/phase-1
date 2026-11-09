# Phase-1

Godot 4.7 project.

## Cấu trúc thư mục

```
addons/             Plugin/addon của bên thứ ba hoặc tự viết
assets/             Tài nguyên thô (audio, texture, model, font, animation)
  audio/music
  audio/sfx
  fonts/
  textures/ui
  textures/environment
  textures/characters
  models/
  animations/
scenes/             File .tscn, tổ chức theo loại
  main/             Scene khởi động / quản lý scene chính
  levels/
  ui/
  characters/
  components/
  effects/
scripts/            File .gd
  autoload/         Singleton (autoload trong Project Settings)
  components/       Script dạng component (gắn vào nhiều node)
  entities/         Script cho nhân vật/đối tượng gameplay
  resources/        Custom Resource (.gd extends Resource)
  ui/
  utils/
resources/          File .tres không phải code (theme, data table...)
  themes/
  data/
localization/       File dịch (.csv / .po)
docs/               Tài liệu thiết kế, GDD
tests/              Unit test / integration test (GUT hoặc tương tự)
```

## Quy ước

- Scene (`.tscn`) và script (`.gd`) đặt cùng tên, cùng thư mục khi 1-1.
- Singleton/autoload đặt trong `scripts/autoload/`, đăng ký qua Project > Project Settings > Autoload.
- Nhánh git: `main` (ổn định, release) và `dev` (phát triển hàng ngày), feature branch tạo từ `dev`.

## Môi trường dev

- Godot 4.7 (Forward+, Jolt Physics).
- VS Code + extension: Godot Tools, EditorConfig, Error Lens, Code Spell Checker, GitLens.
