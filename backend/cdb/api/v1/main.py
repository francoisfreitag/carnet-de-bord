from fastapi import APIRouter

from cdb.api.v1.routers import (
    admin_structures,
    beneficiaries,
    csv2json,
    managers,
    notebooks,
    orientation_requests,
    orientations,
    structures,
    uploads,
)

api_router = APIRouter()
api_router.include_router(uploads.router, prefix="/uploads", tags=["Uploads"])
api_router.include_router(managers.router, prefix="/managers", tags=["Managers"])
api_router.include_router(
    admin_structures.router, prefix="/admin_structures", tags=["Admin structures"]
)
api_router.include_router(
    csv2json.router, prefix="/convert-file", tags=["Csv to Json parsing"]
)
api_router.include_router(structures.router, prefix="/structures", tags=["Structures"])
api_router.include_router(
    beneficiaries.router,
    prefix="/beneficiaries",
    tags=["Import or reimport beneficiaries"],
)

api_router.include_router(
    orientation_requests.router,
    prefix="/orientation_requests",
    tags=["Orientation request"],
)

api_router.include_router(
    orientations.router, prefix="/orientations", tags=["Orientation"]
)

api_router.include_router(notebooks.router, prefix="/notebooks", tags=["Notebooks"])
