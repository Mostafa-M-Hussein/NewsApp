class User
{
  String name  , addres    , about ;
  User(  { this.name  ,this.addres , this.about }  ) ;
}


class Profile
{
  User user ;
  int following ,  followers , freinds ;
  Profile ( { this.user , this.following , this.followers , this.freinds }  ) ;


}