create table recipes(
  id bigint primary key auto_increment,
  name varchar(69),
  servings int,
  prep_time int,
  cook_time int,
  image_url varchar(2083)
);

create table ingredients(
  id bigint primary key auto_increment,
  name varchar(35),
  times_searched int
);

create table recipe_ings(
  id bigint primary key auto_increment,
  recipe_id bigint,
  foreign key (recipe_id) references recipes(id),
  ingredient_id bigint,
  foreign key (ingredient_id) references ingredients(id),
  quantity decimal,
  units varchar(6)
);
