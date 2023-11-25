package training.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import training.model.Contato;

public interface ContatoMapper {

    void insere(Contato contato);

    void atualiza(Contato contato);

    void remove(Contato contato);

    Contato buscaPorId(@Param("idContato") Integer idContato);

    List<Contato> listaPorExemplo(Contato exemplo);

}
