<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Item
      <span class="pull-right">
        <a href="<?php echo base_url()?>item/daftar" type="button" class="btn btn-primary" name="button">Daftar Item</a>
      </span>
    </h1>
    <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover">
          <thead>
              <tr>
                  <th width="1">#</th>
                  <th>Item</th>
                  <th width="1">&nbsp;</th>
              </tr>
          </thead>
          <tbody>
            <?php
              $i = 1;
              foreach($items->result() as $item):?>
              <tr>
                  <td><?php echo $i++?></td>
                  <td><?php echo $item->nama ?></td>
                  <td>
                    <table>
                      <tr>
                        <td style="padding: 2px;">
                          <a href="<?php echo base_url()?>item/edit/<?php echo $item->id ?>" type="button" class="btn btn-primary btn-xs" name="button" title="Edit Item"><i class="fa fa-edit"></i></a>
                        </td>
                        <td>
                          <a href="<?php echo base_url()?>item/hapus/<?php echo $item->id ?>" type="button" class="btn btn-primary btn-xs" name="button" title="Hapus Item" onclick="return confirm('Anda pasti untuk menghapuskan rekod ini?');"><i class="fa fa-trash-o"></i></a>
                        </td>
                      </tr>
                    </table>
                  </td>
              </tr>
            <?php endforeach ?>
          </tbody>
      </table>
    </div>
  </div>
</div>
