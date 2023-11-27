package training.model;

import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Data
@ToString

public class Pet {
    private Integer idPet;
    private String nomePet;
    private String racaPet;
    private String genero;
    private List<String> sintomas;
    private Date dataNascimento;
}
