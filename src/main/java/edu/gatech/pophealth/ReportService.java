package edu.gatech.pophealth;

import org.slf4j.Logger;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;
import javax.ws.rs.PathParam;

import static org.slf4j.LoggerFactory.getLogger;

/**
 * @author Osman Din
 */
@Path("/report")
public class ReportService {

    private final Logger logger = getLogger(this.getClass());

    @GET
    @Path("/{param}")
    public Response transform(@PathParam("param") String msg) {
        logger.debug("GET request for:{}", msg);
        final String result = "Request for=" + msg;
        return Response.status(200).entity(result).build();
    }

    @POST
    @Path("/{param}")
    @Consumes("application/x-www-form-urlencoded")
    public Response store(@FormParam("body") String body) {
        logger.debug("POST request for:{}", body);
        final String result = "Writing entry=" + body;
        return Response.status(200).entity(result).build();
    }

}

