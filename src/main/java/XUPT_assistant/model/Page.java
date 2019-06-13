package XUPT_assistant.model;

public class Page {
    private int start;//起始页
    private int currentPage;//当前页
    private int pageSize;//每页显示个数

    public Page(){
    }

    public Page(int currentPage,int pageSize){
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }



    public int getStart() {
        return (currentPage-1)*pageSize;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
