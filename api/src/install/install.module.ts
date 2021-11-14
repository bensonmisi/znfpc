import { Module } from '@nestjs/common';
import { InstallService } from './install.service';
import { InstallController } from './install.controller';
import { AdministratorModule } from 'src/administrator/administrator.module';

@Module({
  imports:[AdministratorModule],
  controllers: [InstallController],
  providers: [InstallService]
})
export class InstallModule {}
