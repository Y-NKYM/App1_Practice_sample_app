class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
  #Validation有 list -> @listに変更（エラーが起きた際、listに入ったエラー文をビューに送る必要がある。）
    @list = List.new(list_params)
    if @list.save
        flash[:notice] = "投稿に成功しました"
        redirect_to list_path(@list.id)
    else
      # @list = List.all
      # render 'index' #indexはURLで省略されるため。これはアクション名indexではない。
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])    #上書きするデータを取得
    list.update(list_params)         #選択したデータにフォーム情報を引数で渡す。アップデート。
    redirect_to list_path(list.id)   #リダイレクト
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
