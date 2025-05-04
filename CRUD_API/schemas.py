from pydantic import BaseModel
from typing import Optional, List
from models import TaskStatus

class UserBase(BaseModel):
    name: str
    email: str

class UserCreate(UserBase): pass

class User(UserBase):
    id: int
    class Config: orm_mode = True

class ProjectBase(BaseModel):
    name: str
    description: Optional[str] = None

class ProjectCreate(ProjectBase): pass

class Project(ProjectBase):
    id: int
    class Config: orm_mode = True

class TaskBase(BaseModel):
    title: str
    description: Optional[str] = None
    status: TaskStatus = TaskStatus.pending
    user_id: Optional[int]
    project_id: int

class TaskCreate(TaskBase): pass

class Task(TaskBase):
    id: int
    class Config: orm_mode = True
