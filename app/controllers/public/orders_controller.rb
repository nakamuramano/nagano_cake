class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
 　　 @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
       @order.name = current_customer.name # @order の各カラムに必要なものを入れます
       @order.address = current_customer.customer_address
    elsif params[:order][:address_number] == "2"
# view で定義している address_number が"2"だったときにこの処理を実行します
     if Address.exists?(name: params[:order][:registered])
# registered は viwe で定義しています
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
     else
        render :new
# 既存のデータを使っていますのでありえないですが、万が一データが足りない場合は new を render します
     end
     elsif params[:order][:address_number] == "3"
# view で定義している address_number が"3"だったときにこの処理を実行します
       address_new = current_customer.addresses.new(address_params)
     if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
     else
        render :new
# ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
     end
    else
      redirect_to 遷移したいページ # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
    end
    @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
# 合計金額を出す処理です sum_price はモデルで定義したメソッドです
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address)
  end

   def order_params
     params.require(:order).permit(:name, :postal_code, :address, :post_age, :total_payment, :payment_method)
   end

end
