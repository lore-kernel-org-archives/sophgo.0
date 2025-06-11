Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71816275861
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638029; cv=fail; b=cnz1pB4qTfWzrUsiw0yNDuunWx9SyF4nb8NgG9xrQmrkcHKj9JymWHcdHDGrVDRaspoByT9uOZY3b32BzhFvTjJr/XSbvP5++HuNYff0VdHqArwKRSi59xg0oPBR0jMnT+ZrSY1GyWizeOP392h74+OjioVzHcKRTBOlRvHkqVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638029; c=relaxed/simple;
	bh=gRFgAO/T84oYMhaSw7TI0OTk5egFaHccmKsTB/bw2gA=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=DX1Hd3DX8yCBkXm2ewW+92bUDJmdDNgMiPJR20nG/Oj+Ap/OfZ39njn1aGzHrnzgLVIGS4Mqa6AXKG0F6scenMPIlLSMSgI/TXFcObRMGx7LQkqAyHccl2t9Elvz48FCcde3pue2lvyfklCceLUbTt48U6SE5e4s7TMFFX51lHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Yqmb5ryc; arc=fail smtp.client-ip=52.103.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Yqmb5ryc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6mfyiAM7fsdHA6zowYoU3B4PL7KuTbj1H2oIxUOQU++esZKzLLFacR7pBMkosvTKAVZrPGUm6rRCkW/4PqbXeoSDxbPLSN1yJqRsMQWjaTu00Kvfzt1UGv+lGCSFTFDdPX8rdOIlqlxNMNtzUv9BAIMtw2tqDHFm8hMYyJPfOjJ3ldZXC8yZ/U6Ldy8w2/wKyRi1oiJrtCJ2Djk7ZVms8SM6EGK2d5EAXz8kusNi3KGIVHK8FEzDx7DMjaxLRQ09hkRnF7I4clkB2X3MA7Kwzr9QW4jb1u+HHBwQRAQ9U0hydSfFF7m/j5uGSSUCCwG+Vz8UTAXP9LWUp2Vx1uTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMffq0FK3ynZ6v9i5y5+F7uzlktOcaPeLbCGg7vsMo4=;
 b=sgLVQsMiuc8k0J0WS1KiksPwl01eiODeolPfTHpHRSZoFfD9b2zQjSrm48ICsALyMd0ORW/PilyRppXCGEe4tm3MOYwYBOnX4Pc/VCRjnvRV74c7OidG9TH3UEQgqie10Ma5lfARXuF12ZRTv6VQj6hWK0Noq3LplJVnr6gsJc4T2gXyHqMro/u5gf1qKb/ee4X56mU0Gkd0XmEo0DxN+GidytAoCHc/nmDLXtyQbvsiTKp9aO/AcmkDIANVDNjL6Hdvvr8dKcIL2SiU4bFPC3xe3QiaLNOLmWn0D8+C6Dd0NFNvUFVvOBOt+OO4I7BhGbmYiFg4hzIfRTBUG5bm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMffq0FK3ynZ6v9i5y5+F7uzlktOcaPeLbCGg7vsMo4=;
 b=Yqmb5rycDNWgXObE4y4R0YAaGB1ZnM06eYuuIQ871HSrwaokyXlYTvIbaNLluxSwovN/w5/0K5TK+ZNslBR0lWclbvMyjAByjt+NWckT/7Wtj3EhENZD1wHsVbTTp5MHVbwkb8lF4Z/MNCdzRHzGfJMUemjk2ypzKbsL0wu0VjgrEldAq+9HbiZ9UVAL0K3be1aol2vBjAJyy1KowkXQ7BC+GfuoSwamtmxlE+8e2DCfsIA48aXCDXmwRuWiDu/Z+fnLq4xE6OAYs5MwkwPDqhk7/nt6lA7t+dKFuVxPTo21xqm3DbT8G1iOjMjQKxGu/qJkPN1Ngoz/yqapGsJpqw==
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c0::8)
 by MA0P287MB1259.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 10:33:42 +0000
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f]) by PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 10:33:42 +0000
Message-ID:
 <PN0P287MB225861D0FB5C04C32CE4E49AFE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 11 Jun 2025 18:33:38 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/11/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1c0::8)
X-Microsoft-Original-Message-ID:
 <cd6fc0ac-cf28-425b-9708-3c328cd28d96@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2258:EE_|MA0P287MB1259:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cae99d-3863-402e-ee37-08dda8d36f76
X-MS-Exchange-SLBlob-MailProps:
	30ekHghIwFrdYz+DQATrmVRNXcCU+t6gnuzA2tvxDAHOnHeEjvQirSt9jmPSeiahcEDVAALO5YrAuff9oDfdXqtMXkgoDYlCM1VD2jB79xqcP2rKqf9HcUwNV/uHRBjMc1R9zhKMhv7wMjpfBUaaQ4AycGRiWTz/iF3IzSbaAP4e9q6OQsZJ1v5+DAwYdfb3djWNjdcRvyNBZ34NoVd+XTB0X8H0l4p+92KZYO/F918qsVy4x57IUipMafRiufhNnDkqJM6yy0/uY/gMfwxQxmKFevcVvClRoK7bRx7WuphGpBQrquWuiI3bnQx2dJK5YHZcrRVKkZMyqZtQzoedoaxAZ8VY5VbIqZVmcZAVG3QRJKSv8NqrVbuJMcrQPyIEp9LgmVZCTds1zWXIEhJMAr+mTxlwIsjXs+AMxt2YiC9HMc6vDEQ2hTQC8OH9LkGqf9Bob1sMyEVr7US1DNA8OYylp7Bx/5NzGArGn4Yrf4bdZUPz/xPx9/RotCe51aQul3kqoKVo5evsjHsN/7q3Z16Y4BIXTDRfhDz/WIvABzcKCfKN861tRFbMrVEyJ/FqI6ClLI12PozPOL7vg1vAS7Rzj7kmQTAD7qj4BVyu1cXZOggbAO/0uDIK0u7celCD6Kq8zMae0tI/k9LMiKCR/pG7S6os2lXqVaM5LmIURCkaYLx7/D6lvb1QhlvkS5mzMBu7KwpihY3Mh0nnALTuBdYyiSgUuwPqLyawOD0Uvnjp+q0GCwxDvnWZujf+t8yw
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|5072599009|8060799009|7092599006|19110799006|22402599018|15080799009|13041999003|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akVHVGlJY3RmZkgyaGdmbXFKRy9CcE5SdEZEeTVhRnNsSWVaVWhvaFVNT040?=
 =?utf-8?B?OUUzQ0d5VUIwUDR5SGxhdTdzTkNQeUM1S1FtU2cyT21XWDBnb09NaTk1TlV2?=
 =?utf-8?B?KzB5b2VqTUNjMGkwbUFTZDk5a09XeTBwR2VZWGlINitPS1Rob0dOZzVLcllP?=
 =?utf-8?B?Y0taZWJGKzRHWVFFNi9vTm5nMldubnlMVFB2YkxDc2V0cnVVc01SN2ltWlFO?=
 =?utf-8?B?dVRRaTAyT1dsWlFBSW1NVHRLeXNaaU9FSDltM3d3Ui9hSysra3Qxbms0Wlpa?=
 =?utf-8?B?dHFxZkdkakh0clB0RjVJeS9yT2tWdWxFNm5JWXhUTVMxbjhBL25FT003aTZY?=
 =?utf-8?B?OFNwTWF4d2RoOWdlZFhoaWtoTVlpektXWVJFQWFlUHRBWXFGRkhIYmJqWEhi?=
 =?utf-8?B?cGlsbkd3ajFyQ2FiTnBnWkFFcWdVaUhxNWM3UnVYQVdGbkdJN21wOGNwSTZY?=
 =?utf-8?B?N1RVQ1JvcTB3dzhnL1ZXaCtndFZmbUxkZG52VENxdTZoTGwyUmpkdUF4TGln?=
 =?utf-8?B?a25XMCtVdi9Ec2hWckZaSmY0dVNwZk83UDg2aWxGQVBHN2dvQm9EREZlN0lP?=
 =?utf-8?B?TEFmTm4reUIyMmVCTnRhbGJqektqZ29lN01sOGF3NHJrRjZIR29MUTlUUERQ?=
 =?utf-8?B?SkIzRys1NFhmNGlXZ1BNMEw4dzFDcW9NdUFBSURyUkZnQmk3aVRFaUovMHY2?=
 =?utf-8?B?M1lDekR1ZWlqYVp3dnZrc2xScXlESnVibjhGUmdZc0NxNkJVa2p4cWZkMk9Y?=
 =?utf-8?B?UnpqdFBhMGFmVFUwYkRJd0ozd0J2TjlzTUJ3eURUdHBhZXB2YS9ZbVA5ZTBa?=
 =?utf-8?B?eXA1UDFKL0d0MENNbGZYL3lYV2VtSE14TlRDU1FPaWEvMlhJNjc4STEvRTRT?=
 =?utf-8?B?dVNKQW1pVTY1M09CQlIwN2RlTGNHY1kzVTZvRkwxdi8rVkFnVUJaZ00yNTNs?=
 =?utf-8?B?QS94VEZCWm45U2pvM0RSWjZzRHVrcWxtY2ErSzd4Ly9ON0RvTnZkcTlMRXRR?=
 =?utf-8?B?UXBsemFEL1cxQURQK2ltNjJsNGVCb0J0M2toVmE4Rm5zSmMxY1hQMml5enRP?=
 =?utf-8?B?c29rZStVRkZQekJHRjRkRStFeXRIMERPcGQ5Z0tIZ281eWJvUHpUNUswK1ph?=
 =?utf-8?B?RmNjUGJOa3ZwazRkMHpHaXhranhmeGZYRzM5a1F6T0xOU1pTaWtreExGYkdo?=
 =?utf-8?B?THlpM1IyQXdiR2U3RmNsOWY5bVNuNWhjOTdLOE9nT0VhQzFDSmdYOEFOdnRM?=
 =?utf-8?B?WGtTQTNMelhJRmh3OGRZd1VsWkswWUNjeFF5WU9WRUtBbGRVb1RLd0Q4Zm14?=
 =?utf-8?B?YmhsTXUwNiszWXZLUkFDQk11V2M0MVdjQXRQRlFnU3I4NWFBaVhGK3JtSWV5?=
 =?utf-8?B?STlyZ25ZY2tVNDR4NlN4dHUxWFllTWxTclc4SlV1b2h2QUFINjRTTkhFRDRR?=
 =?utf-8?B?WEhVd2NSbEJ5WUpZOUF1QTIxNUJxSVpiMm81bmozd3FhdVBSdDJMOXdIcmly?=
 =?utf-8?B?eXVxaFdIcUc1TzVLY3hIWFhxdXRia2hSVGN6YWN6RmpLQ3dUNlhLZTduQU1G?=
 =?utf-8?B?elpyNXBwdEs0am1FaktpRFp4dFVMRE5DRmgxdXUwaHgwd0lKQk9qM3dFU2pQ?=
 =?utf-8?B?UVhydFVwcEdhWFVrY016bjhGdHpQaG4xUFZDVUtuK3REbDFlaXFkYlFHSTBq?=
 =?utf-8?B?dWFmR0FaU0wxelN4V1dUcmUxVFZ2amlIamlpZnRxdzVCSUtBYlBqV0dFVjJl?=
 =?utf-8?Q?5zh7mGbzLQj+9KTjJM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHFRZmxLcmpTaE5uRkkwZUQ3N0k4WStkTGlYMlkrV01SZ2hxKy9MSDBzYmRL?=
 =?utf-8?B?djd6Mmloc3l3MVA1ak9Td0w5RFVHcXA4eEdMQk9talBnUDg3b3VGc2ZFOWcz?=
 =?utf-8?B?Y3VpY0huKzVSSkNqY2VrelVTVjExQ0krNGx6VlVxa2phdkFhZnNNSFJEOGY1?=
 =?utf-8?B?eHpKRUI4MnBrY1BLWDNhZ21IcjA2NjN4ajZwd3B1U3NLM2pTMXp3ZGxtVGZ0?=
 =?utf-8?B?akI0T3h1akZuSHljd0FwWEtsMkZpazdTTHQ5Q0RUMHp6eTRZRGJpblFERkpy?=
 =?utf-8?B?Y0tyUU9BNVd2UjdQUmlrd2JvU21DeTJjSWhVSzRjZGMwS3l5L3Z4MkZpbkFC?=
 =?utf-8?B?dHg3QUIzZnJNNnJKMm5nclE1RS8veEl2L2hkcGNRZTJrOHI0YVh6TGcvalY1?=
 =?utf-8?B?dndkL2xGRlRJdCtycjRUVFlnTEJKTk4zSEpodVczRTBLZU1JUDYzVEpsT1Vj?=
 =?utf-8?B?WG5YRG01SkwvSkJwbmFJTFlRRmhhRHBaM0E3TjRsVzdxbUYyejVkOGpVS2Nx?=
 =?utf-8?B?WUdxeXRXY2xVVWJtWHBKYzdVdmFOb2RlZk1KK21QTjF6YTEyeG1NemZ6QkFw?=
 =?utf-8?B?UVV3TVFHclppSkpCbzVjVklReStMaVlpaG9QZEU1RGZ3cHBvckREYmptbFZa?=
 =?utf-8?B?a2JQeXNMdzA2M3RPa3FlUUNJaklseXhtYkp1cGdWY0xGRzIzMnRTSDF1K0xD?=
 =?utf-8?B?L0l6RlBReUlUeU5vekRMZUMyVmlUNEZCdm8rbXQvSys2c2FhVDNwUVgwSDFB?=
 =?utf-8?B?NDBjajFUS2N4K1pEV3VnRUlHdW9jazdzc2FaeFFEcXRYcWpNVkt6VVNGdmFC?=
 =?utf-8?B?VHM0S1dSNHFyS0Q3Uy9SUTh4di9YVXVVUnljVGU4djROMFNtQTdlY2xYMmxH?=
 =?utf-8?B?QzVIMHg1eERLVDZ4bkdHRWV2aXJqL3kxeC9uQWVYdk1RbDhway8zaVZualQr?=
 =?utf-8?B?di8vT1I1MTAybm80UkN1NStWN2FaZFhVZUM5VXVVSzR4RHc0NitJaEtFY2lL?=
 =?utf-8?B?ejl1SjdFc25KVVRJMGMvczVENENuT1c5MEpQWjdaSHNabStnWVU5NnMwK1F4?=
 =?utf-8?B?Z2RIOURXekROUWJDVGUwYXhoellseDdSWXRsbUZvSk5DNUhUSFRUZ0VPQm9G?=
 =?utf-8?B?dEV4cmZ1S0lYZkVYQnBXaVUzK3RyMjRNY01hNzlCT3VZZDJGMEg1aVU5NExX?=
 =?utf-8?B?N0NKZ0ZqY0ZuSzgzUHNCaTdMVE44UWU4cU41Wit0dytpR3hoK3cxNVZRZkFG?=
 =?utf-8?B?a1g3ODFzVForbDNtdUY2Qk1KbGd4TjVrTUhGZkt6bW90RWRhVVJvb0grWjdQ?=
 =?utf-8?B?WEZHcEV4Z2Z2MWxkVXZHa0wwd2tYTGlSbEltSElPWEd1ZDBoWitTdktZb0ZU?=
 =?utf-8?B?eTFOelJwcVFNMDhlaE1wZFRTWTVPbVc5Tk9vV0tZUFhYS3JZODMwZUlPT1E3?=
 =?utf-8?B?YnhWWEkyNDlxRWJDUldRd0VsQ1JReTZBQ3BtRCtlREdRZzg2c2ZZUTZpSjNX?=
 =?utf-8?B?ekF3dFMvS09jbXpJZDdpYWRmSDRDdmpHdnpUelY2T2tBUzA5TmVld21wTkFo?=
 =?utf-8?B?ODRLaVpyUFVwbW13Wk03aUwrR0RrU00yM1ZieU10dm1iNTBUZkw3VGQ2UlJL?=
 =?utf-8?B?UC9HZ0p3RXFXR00zbW9sbXMzNXpTbGRVdmF2cFZXRU1FQVFGdFBNVTIraGJK?=
 =?utf-8?B?YUE1V2Fmb0dUVC9RTzJJSEJtZFA1dXlMQ3hyQkxLS01QbTV5TmhucGVDREgv?=
 =?utf-8?Q?RnaI4bGbQ8PbkrfIH6JxivPS7egXmKeFOgDRg7p?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cae99d-3863-402e-ee37-08dda8d36f76
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:33:42.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1259

Hi,

Due to many new patches about Duo are submitted today, I have a quick 
update:

Last updated: Jun/11/2025 @https://github.com/sophgo/linux/wiki

Quick Summary:
- CV18xx: Reset is updated to v3.
- CV18xx: Top syscon new submitted as v1.
- CV18xx: DMA-MUX is updated to v14.
- CV18xx: USB phy is updated to v4.
- CV18xx: Old ETH patchset is divided to two, one is ETH v1 and another 
ETH mdio v1.
- CV18xx: Duo Module 01 EVB updated to v7.

Thanks,

Chen

