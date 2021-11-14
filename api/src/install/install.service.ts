import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AdministratorService } from 'src/administrator/administrator.service';
import { InstallDto } from './dto/install.dto';

@Injectable()
export class InstallService {
    constructor(private administratorService:AdministratorService){}

    async install(installDto:InstallDto):Promise<any>{
        return await this.administratorService.create(installDto)
    }
}
