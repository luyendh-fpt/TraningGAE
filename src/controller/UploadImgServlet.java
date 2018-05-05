package controller;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class UploadImgServlet extends HttpServlet {
    private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().print(blobstoreService.createUploadUrl("/upload/imgs"));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BlobKey bk = blobstoreService.getUploads(req).get("myImg").get(0);
        HashMap<String, String> map = new HashMap<>();
        if (bk == null) {
            resp.getWriter().print("Server Error! Can not upload Img!");
            return;
        }
        String result = req.getRequestURL().toString().replace(req.getRequestURI(), "/view/img/") + bk.getKeyString();
        resp.setContentType("application/json");
        resp.getWriter().write(result);
    }
}
