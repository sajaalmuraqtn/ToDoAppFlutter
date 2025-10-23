class TaskModel{
    String taskTitle;
    bool isCompleted;
   
   void toggeleCompleted(){
    isCompleted=!isCompleted;
    //completeتعكس حالة ال  
    //if true -> false & if false -> true
   }
  TaskModel({required this.taskTitle, required this.isCompleted});
}