Rails.application.routes.draw do
  get 'course_teachers/new'
  get 'course_teachers/edit'
  get 'course_teachers/create'
  get 'course_teachers/update'
  get 'course_teachers/destroy'
  # get 'course_students/edit'
  # post 'course_students/create', to: "course_students#create"
  # get 'course_students/update'
  # get 'course_students/destroy'
  # get 'course_students/create'
  post "/course_students/:id", to: "course_students#create"
  post "/course_teachers/:id", to: "course_teachers#create"
  resources :course_students
  resources :course_teachers
  resources :cohorts
  resources :courses
  
    # get "/courses/:id/:student_ids", to: "courses#add_student", as: add_student

    # get "/students/:student:id", to: "courses#add_student", as: add_student
    # get "/teachers/:teacher:id", to: "courses#add_teacher", as: add_teacher
  
  resources :teachers
  resources :students
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
