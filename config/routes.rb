Slick::Application.routes.draw do
  get 'shared/index'

  match 'addresses/create' => 'addresses#create', :via => :post
  match 'addresses/modify' => 'addresses#modify', :via => :post
  match 'affiliate_details/create' => 'affiliate_details#create', :via => :post
  match 'affiliate_details/modify' => 'affiliate_details#modify', :via => :post
  match 'affiliate_payments/create' => 'affiliate_payments#create', :via => :post
  match 'affiliate_payments/modify' => 'affiliate_payments#modify', :via => :post
  match 'affiliate_payments_sales/create' => 'affiliate_payments_sales#create', :via => :post
  match 'affiliate_payments_sales/modify' => 'affiliate_payments_sales#modify', :via => :post
  match 'bid_ticket_types/create' => 'bid_ticket_types#create', :via => :post
  match 'bid_ticket_types/modify' => 'bid_ticket_types#modify', :via => :post
  match 'bids/create' => 'bids#create', :via => :post
  match 'bids/modify' => 'bids#modify', :via => :post
  match 'bids/search' => 'bids#search', :via => :post
  match 'broker_details/create' => 'broker_details#create', :via => :post
  match 'broker_details/modify' => 'broker_details#modify', :via => :post
  match 'broker_payments/create' => 'broker_payments#create', :via => :post
  match 'broker_payments/modify' => 'broker_payments#modify', :via => :post
  match 'broker_payments_sales/create' => 'broker_payments_sales#create', :via => :post
  match 'broker_payments_sales/modify' => 'broker_payments_sales#modify', :via => :post
  match 'coupon_codes/create' => 'coupon_codes#create', :via => :post
  match 'coupon_codes/modify' => 'coupon_codes#modify', :via => :post
  match 'credit_cards/create' => 'credit_cards#create', :via => :post
  match 'credit_cards/modify' => 'credit_cards#modify', :via => :post
  match 'disclosures/create' => 'disclosures#create', :via => :post
  match 'disclosures/modify' => 'disclosures#modify', :via => :post
  match 'events/create' => 'events#create', :via => :post
  match 'events/modify' => 'events#modify', :via => :post
  match 'events/search' => 'events#search', :via => :post
  match 'memberships/create' => 'memberships#create', :via => :post
  match 'memberships/modify' => 'memberships#modify', :via => :post
  match 'negotiation_logs/create' => 'negotiation_logs#create', :via => :post
  match 'negotiation_logs/modify' => 'negotiation_logs#modify', :via => :post
  match 'offer_disclosures/create' => 'offer_disclosures#create', :via => :post
  match 'offer_disclosures/modify' => 'offer_disclosures#modify', :via => :post
  match 'offer_tickets/create' => 'offer_tickets#create', :via => :post
  match 'offer_tickets/modify' => 'offer_tickets#modify', :via => :post
  match 'offers/create' => 'offers#create', :via => :post
  match 'offers/modify' => 'offers#modify', :via => :post
  match 'offers/search' => 'offers#search', :via => :post
  match 'payments/create' => 'payments#create', :via => :post
  match 'payments/modify' => 'payments#modify', :via => :post
  match 'sales/create' => 'sales#create', :via => :post
  match 'sales/modify' => 'sales#modify', :via => :post
  match 'settings/create' => 'settings#create', :via => :post
  match 'settings/modify' => 'settings#modify', :via => :post
  match 'ticket_statuses/create' => 'ticket_statuses#create', :via => :post
  match 'ticket_statuses/modify' => 'ticket_statuses#modify', :via => :post
  match 'ticket_types/create' => 'ticket_types#create', :via => :post
  match 'ticket_types/modify' => 'ticket_types#modify', :via => :post
  match 'uploaded_tickets/create' => 'uploaded_tickets#create', :via => :post
  match 'uploaded_tickets/modify' => 'uploaded_tickets#modify', :via => :post
  match 'users/create' => 'users#create', :via => :post
  match 'users/modify' => 'users#modify', :via => :post
  match 'users/auth' => 'users#auth', :via => :post
  match 'users/forgot_password' => 'users#forgot_password', :via => :post
  match 'users/change_password' => 'users#change_password', :via => :post
  match 'user_groups/create' => 'user_groups#create', :via => :post
  match 'user_groups/modify' => 'user_groups#modify', :via => :post
  match 'vendor_events/create' => 'vendor_events#create', :via => :post
  match 'vendor_events/modify' => 'vendor_events#modify', :via => :post
  match 'vendors/create' => 'vendors#create', :via => :post
  match 'vendors/modify' => 'vendors#modify', :via => :post
  match 'venue_groups/create' => 'venue_groups#create', :via => :post
  match 'venue_groups/modify' => 'venue_groups#modify', :via => :post
  match 'venue_groups/search' => 'venue_groups#search', :via => :post
  match 'venue_rows/create' => 'venue_rows#create', :via => :post
  match 'venue_rows/modify' => 'venue_rows#modify', :via => :post
  match 'venue_rows/search' => 'venue_rows#search', :via => :post
  match 'venue_sections/create' => 'venue_sections#create', :via => :post
  match 'venue_sections/modify' => 'venue_sections#modify', :via => :post
  match 'venue_sections/search' => 'venue_sections#search', :via => :post
  match 'venues/create' => 'venues#create', :via => :post
  match 'venues/modify' => 'venues#modify', :via => :post
  match 'venues/search' => 'venues#search', :via => :post
  match 'event_disclosures/create' => 'event_disclosures#create', :via => :post
  match 'event_disclosures/modify' => 'event_disclosures#modify', :via => :post

  resources :email_templates
  resources :users
  resources :addresses
  resources :affiliate_details
  resources :affiliate_payments
  resources :affiliate_payments_sales
  resources :bid_ticket_types
  resources :bids
  resources :broker_details
  resources :broker_payments
  resources :broker_payments_sales
  resources :coupon_codes
  resources :credit_cards
  resources :disclosures
  resources :events
  resources :memberships
  resources :negotiation_logs
  resources :offer_disclosures
  resources :offer_tickets
  resources :offers
  resources :payments
  resources :sales
  resources :settings
  resources :ticket_statuses
  resources :ticket_types
  resources :uploaded_tickets
  resources :user_groups
  resources :vendor_events
  resources :vendors
  resources :venue_groups
  resources :venue_rows
  resources :venue_sections
  resources :venues
  resources :event_disclosures

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with 'rake routes'.

  # You can have the root of your site routed with 'root'
  root 'shared#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
