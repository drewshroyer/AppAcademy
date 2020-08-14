# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

cats = Cat.create([
    {birthday: "2018/05/30", color: "red", name: "jerry", sex: "M", description: "like tom and jerry but just jerry" },
    {
    birthday: "2019/11/20", color: "blue", name: "godzilla", sex: "F", description: "not a cat" },
    {
    birthday: "2017/01/23", color: "green", name: "tiger_king",  sex: "M", description: "big cat king" },
    {
    birthday: "2015/03/20", color: "yellow", name: "garfield", sex: "F", description: "lazy cat" },
    {
    birthday: "2015/01/20", color: "beige", name: "boring",  sex: "M", description: "He is a boring beige color."}
])