Rails.application.routes.draw do

  scope module: :public do

    resources :addresses,except:[:new,:show]

    get    'orders/new'
    post   'orders/confirm'
    get    'orders/completion'
    resources :orders,only:[:index,:create,:show]


    delete 'cart_items/erase_all' =>   "cart_items#erase"
    resources :cart_items,only:[:index,:create,:destroy,:update]

    get    'customers/mypage' =>       "customers#show"
    get    'customers/edit'
    patch  'customers' =>              "customers#update"
    get    'customers/unsubscribe'
    patch  'customers/withdraw'

    resources :items,only:[:index,:show]

    root to: "homes#top"
    get 'about' => "homes#about"
  end
  namespace :admin do
    resources :order_items,only:[:update]

    resources :orders,only:[:show,:update]

    resources :customers,except:[:destroy,:create,:new]

    resources :genres,except:[:destroy,:new,:show]

    resources :items,except:[:destroy]

    root to: "homes#top"
  end
  devise_for :customers, skip: [:passwords],controllers:{
    registrations:"public/registrations",
    sessions:"public/sessions"
   }

  devise_for :admin, skip: [:registrations, :passwords],controllers:{
    sessions:"admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
