# README - One-Sided Markeplace

A cross-collaboration effort between Chris Hullman and Ian McAteer

Developed with Ruby on Rails v5.1.6

Story points of functionality implemented: https://trello.com/b/FuI7N1fL

## Setup

1) Clone the master repo

```
git clone https://github.com/chullman/instrument-marketplace.git
```

2) Install gems in gemfile

```
bundle install
```

3) Migrate into to local sqlite db used for development

```
rails db:migrate
```

4) Seed in an admin user for the marketplace along with a couple sample products

```
rails db:seed
```

Email: admin@admin.com
Password: admin

Admin only portal is accessed in the /admins url. E.g. http://localhost:3000/admins