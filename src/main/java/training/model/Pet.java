package training.model;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString

public class Pet {
    private Integer idPet;
    private String nomePet;
    private String racaPet;
    private Date dataNascimento;
}
