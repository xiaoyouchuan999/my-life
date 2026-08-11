# My Life！GitHub Pages 部署

这个项目已经包含 GitHub Pages 自动部署配置。Supabase 的 Project URL 和 anon public key 不写入仓库；网页首次打开后，在“云端同步”页面填写即可。GitHub Actions 会运行独立的静态网页构建命令，不依赖当前的 Sites 托管环境。

## 1. 创建 Supabase 数据表

1. 打开 Supabase 项目。
2. 进入 **SQL Editor**。
3. 复制并执行 `supabase-schema.sql` 的全部内容。
4. 在 **Authentication > Providers > Email** 中启用 Email 登录。
5. 在 **Project Settings > API** 复制 Project URL 和 anon public key。

## 2. 上传到 GitHub

1. 新建一个 GitHub 仓库。
2. 把项目文件上传到仓库根目录。
3. 在仓库 **Settings > Pages** 中，将 Source 设为 **GitHub Actions**。
4. 推送到 `main` 分支后，Actions 会自动构建并发布。

## 3. 首次使用

1. 打开 GitHub Pages 网页。
2. 进入“云端同步”。
3. 填写 Supabase Project URL 与 anon public key。
4. 注册或登录邮箱账号。
5. 当前浏览器中的 My Life 数据会自动写入云端，此后各设备登录同一账号即可同步。

## 数据安全

anon public key 是 Supabase 为网页前端设计的公开密钥。`supabase-schema.sql` 已启用 Row Level Security，每个登录用户只能访问自己的数据。不要把 `service_role` key 填入网页或提交到 GitHub。
