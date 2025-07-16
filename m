Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010002.outbound.protection.outlook.com [52.103.68.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D812C544
	for <sophgo@lists.linux.dev>; Wed, 16 Jul 2025 00:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752625925; cv=fail; b=NDjp2dNjcJPlVyVyjIcnlrSDkocdyb7MKc59v/7+hcz3iKq6o7V6YMH/yF2nAQXNBIR0A1nL4W1i6REhpyLzwr4SVbpVFQh8oNtABN4YDuVbNv0GvJ8vKBCsIKwlR3lm5Z9YfIg7pvE7eDpU3qpqVKJ35Oz0QjyuY/9wDT4aawA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752625925; c=relaxed/simple;
	bh=8ZnbG02J/y8ziTnMC8RlKGZm3BBcMj9fipM4B/PB2Ns=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Bn08EQGJ6SgRDAjJNA+RqtJwgfuuqsBZ+2ppCHhlpDhOqavDnb+t0t3JmrF9JN94EGyW71/GEls3nmDXWJu2+JogoQz1+s7g1HHjH5lUlah0Dp8ni2IsUiIWAO4Jwi0W0noDNZFyyqacy8Ix3/CrtwzG9Lf5iToealf4ZG6JL0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=G5zj5GOk; arc=fail smtp.client-ip=52.103.68.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="G5zj5GOk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd96e2Hhds2uInntNyl/7mR/7YWMBxT0e+XGs4AldfhNJWJD5omDwsHztyPlKcrCrgz88lIej/bIlH5CWViy6ckZB7y38a+8+5sxK5ro3QPjkkdiwgGXHBuJ7XuBdg9KJfwZw/amAlGAYJIjrkzPQMddFsOc1egN2Y79HrTrGf63z7/P0rvOrebPlp77iKhFle3QZ698vwQzbU25oZn0kq/A4lY37uDtpRtZ1P+GkOssFtpItOWiSGePvFdUPpiPyZxkPGufvJOos5PwzmXLYQ+wXRvkiWVJsjD4vOG2dCh3ZyeLHLZRq8wheLawbugC/X3SaXIF5CQm7CNjPrSXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mn3SdYuMpdjQtw9GbiOSX2xVQvZrUvFPyYidOeGwUu8=;
 b=n1R4Nhyhxr8vLHUmpH8aMn+4sHC8xopREdPLda7wgMigXj7sRAa91HiFtFIytNczS+BVLe+usngAVH9f9b9y6MQFGo5swSmlqqknNmHsfBgpXxK+v3YlkEvLBr32DViY/SqjcCdmOLi7ovDqFOeCbBnvARljCOB7rumWuB5WqjuUN4/5YWnP9iaWS/onKpCwktMoe1gn9+njwnxMBQTikukzZOf2V1lJMSMuwe4krhiRCRiOMwIQf0/5PI2GruNXWN1DhjQZ9fFBdz4iFzUh9jp9SoSMufjJLu8Y79dS59NZZE5J4wVvgQ9wkektRVEVJyV+WpGRx3TKSUJ4KYAizw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn3SdYuMpdjQtw9GbiOSX2xVQvZrUvFPyYidOeGwUu8=;
 b=G5zj5GOklleq13qJ3TyXrg6RrrpIfCzEZJMZm1NMhhiSqSUdod9sackCEflEsbNb3uGaGMaCmaWkrN1+rE29YiQyc/jQa1a2L5SbTAGDA7ZTlAfVKxjN00io4r7oJH3iNmz7eRLXfMGYfY27ABMNklsPcsBYq0U+37SGRsa6tocdkJtr2+4ipMOXw2PZOQb0wvqywd/9dggAhPWFViFrg6qzRQzjQXIxHpxvl/NC14FBNLeu0x9596u5S3jmY0C+hj/SlfhlEnocZYjJgR/pf7inc9Zmw8sfZetQsFNFwiP/yMs9NFQn/TitlSVk59fW3Hrtg2Iuqf066yaKvd8Ryw==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MA0PR01MB6008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:4b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 00:31:55 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 00:31:55 +0000
Message-ID:
 <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 16 Jul 2025 08:31:49 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <unicorn_wang@outlook.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <e44b5620-cae5-47f9-a1c0-5e7d44c44e68@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MA0PR01MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5bdb98-2793-4d9e-7c42-08ddc4002a87
X-MS-Exchange-SLBlob-MailProps:
	RlF2DIMZ1qUsugoWJkXzdbXLEldi4LgXmHK/9uv+INtb+qUZgWPXzLCsspxNxyqvrTVV0qjpzsSVhWD0rP/Pg7Wz2g9O2PvVofnAisS3JrHx8XzeSTU9fruUuWfOUfW9lJXExS51RegyJy1gadN4Z7fUU4Po7/luhT/K+2mA25A3/y/d2W4RZPqXaPi3GllCD73UdGCxL4PD/6zSTraH4hSoEYXYKTRg1pxwu0z1+gCvDy2cgpcEGyFKUCB4oDArYOPcVZxSiaF/PqMmy9W1hlmubDE7Hq5B+7vgmqB0IOdAGLDt54P71ahICFxIv7i5lNrDJOZ2Cki6wObm3VpIFyIrRf/PWFFFq4b9PBVVvhj5x+z1xuSDHZs6srOGaBSHWFaC4LSZrAm5DknKXsZSWgPcpAUypGs6+qkqLUYy+jlDkqVlH35EmAWwQMbT0GNyrqB9yuABOr7WIcdEPvFG161MUseXUrU66sUR1FW0pCS70MUGMOc+hWs65WKnAVV/GY86mPIKGuMfQgA27fHz7bMLYxGBdr6V7uxDieOCniM3vsl+qKPhP7gJFDyJRf8l7Qhd0UmqrGqdvIEPXSwlXtrbGld3KrTZukreNZZkqph4qkuv4KwactMsqF+VSH4O17ASc/3wvzd+ABfTaIvnvMZA3grIo8OGk4WEL/GRiCqZ61QRAprdKrUiHgHoj028VBI+DrdOUbJTlxBqJxfaoDWXIbn+tbKNMgcfDQf6Fm2gUJgoDmvhGvPOq5Fefl/RZ44lMqsjWWuPE1seb77cy0vVCbRBQfJATUvdVxo6swVUCb+JN3LG4KQGOzjdo6lVWflBk/UdbARW0Jy37jIjN8nVuh6b0q/d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|15080799012|6090799003|5062599005|1602099012|51005399003|440099028|4302099013|40105399003|3412199025|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUtTMklWdjRIYlUxcFZaVlhIcDEwWFJFWTdRNGE0aUl3dHpRbGRUREhwMCsw?=
 =?utf-8?B?bmZvVFUxL29vTmNvUXR4czBkUnZnV3hkQXRESHBzQUhNUUtydVhmYktKRTV3?=
 =?utf-8?B?R25zZ0VrN3BBSVFXU2JTM1NzSVB6ZjZNNVFSVll1alg1Z281Qmd2ZnJGNmh0?=
 =?utf-8?B?dXJpS1ZKRURkQ2pLeU15UG1TdXZIUjZDbXlNN2g1WFJyVkxCa2tRejhTdFFu?=
 =?utf-8?B?OUVGV3FmcnREaExTZXljZCtQVUd1MnlYWk53N1FhZG8vRVZ2WVRGVDZ2NDla?=
 =?utf-8?B?c0dWTWMzdGtpT2NwS3lSbmJaaDhQVXVYL2xiM1FEMUlZZjhMOTIrWFVYZDRP?=
 =?utf-8?B?OUNVM1h4UlRxQ1FPT2FjQXdxWjE3VkM2Q1h1SXZEalAwczdybnF1a0FIWWY2?=
 =?utf-8?B?NXdkN0xrN0FtVllNVDlLTW4yVHZuTEhZUUhBelZteXhwR20vUmZsNmhieGpw?=
 =?utf-8?B?UUxiR2ROREdDdTNFbWVaUU8xY3FnV1VVSXlCSWFoZVkxVnpIcUszcThmUTh0?=
 =?utf-8?B?SE5ONUwyL0tMZ0R3Z1NKUWJ0MktTMFVnWGNhR1VObFlFamIxdXZteTBuMlM1?=
 =?utf-8?B?d0c3Z0Z1NjlpeEtSalJwalB3YkZNa3VabGhTaTNEMHZnTjkzT2IxRkVuQVN6?=
 =?utf-8?B?cXNiVUtUUU9nRGV3TkI3bnBzaXhQSWJpekJSWmRFaHN4SE1JUWtBTEtSQU1C?=
 =?utf-8?B?SkdNZ3ZSZkV6Zk5qUDBsdmpCcjlNYkxhK1gzR0VmMk1FVU01YUttNWxTTDc3?=
 =?utf-8?B?OFZvaGIwaWg0VDRQbkdTN25CWFFMVm1XcUdJOUZtb3g5Nm94dEhYL2puaWY0?=
 =?utf-8?B?bkw2eXJURTFTbE1GN3JBTU5tMVp3RDhQaHVKbzZLM0g4aE5SanZnWHpyb21N?=
 =?utf-8?B?TzRMYUJpanM0RnNGRnQ4eisvVVlPeE8yZ1BUTlZaV2paVFRIQjZUZ2czTEZT?=
 =?utf-8?B?d1luQWJhMlRmRC80NnM0eWVxMm9SOGx4djZVazFJVXZoK1ltTjVXUEg5V2R0?=
 =?utf-8?B?SWpIMUVTV0VXUmxZUk9xOTUyK0JYWWMvOHV0Vi9DbE5TSVkvWENTTGU4Z2lo?=
 =?utf-8?B?cFRTdTRtVW00eHl4NUxjUFJ6aUduZUY1NHcwRHlvM25PL2JGNCtiS0c5emdy?=
 =?utf-8?B?R3JDdGl2czJUM2gzTzY0ZWNRcE5Bc2xTditCaHNPWDllSE54NWhqblVLblht?=
 =?utf-8?B?cHhadHhsamNrcE91dWpTVUlqa2Uzbm9JS1RqejR0ejMrNE55NmhEOGNzSGli?=
 =?utf-8?B?T290QkpIU0x6MzhlMEpKN1Zldm9JTXRwOWVEb3owcnNHT3FCNjZheVJZdWdQ?=
 =?utf-8?B?NzBuZ090RXZNb0dJdGt2MkU4R3IxVFpPdEpFL2NsbUtCZisyclBGdlFsdHhj?=
 =?utf-8?B?RUNOdWI4S2w5QmhZK2RmMkZsbi9VRWlLMVlLNUpZU0x6M3JOQ1o1M2I0OTVj?=
 =?utf-8?B?OUlTQmMxYkF1WmdKQVJ3alNMcy9SdU1mV1V5VWNqMmliSGxnUDlXbHpPWW5a?=
 =?utf-8?B?M3JLTWF1WjlOVXRwMmE3R3d6RnYxQ3ZFMzI4ZENiQUpGYWpvSTR2aTFlSjZN?=
 =?utf-8?B?Q05ncWpVWGM0Z0hGbGIzRkxHY2Jwd3NHeDFlK0xlcHM4M3Qxem8rRlVrcEVu?=
 =?utf-8?B?Vy9EYi82OThaWHhiUkJ1dlVTb3pwSnBkM1FTRmJaamwwRXN6V0lJUzhNOXhy?=
 =?utf-8?Q?aYmUqu1wYrM/qX89ZD7U?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bThSSStzbnZPaXVxNEZxb1dVWDFuL2xEY0lNbnZQZExhOTk1S0h3WWlyRkNW?=
 =?utf-8?B?bVY1ZnVhMWxNa2RvQS9qdm5qQTNGWkQwTGtRVFlsNlRqZTVta3NCUnEzdllG?=
 =?utf-8?B?ekgrL05BcW1lWGxRTGp3dXVvelF6bHZhaDBEUnBBYWxUenkwU3d4L1RRZy9w?=
 =?utf-8?B?cHgvdEJqYWE4UHE4RmtDWENwVmQyV1UwRWhMQjdXVDJUN1dwbW5mdldZZVFK?=
 =?utf-8?B?dGxkOFFld2pTYzhwOE1nb0tQSFRKRHJTN2txTmZzWTlHZC93TE50anpsWVls?=
 =?utf-8?B?aFVIeDVFWmhsZUpGWXhoS2IwUGZZZHVDblZwd3dnMlNPWFhnVTVqd1JUS1Yw?=
 =?utf-8?B?eFZNUW1vSlBLV2pkVDl6ampRNUZDNHpVWjFpZXovcElJZkx4enZLUzRsdDZr?=
 =?utf-8?B?Y1FmYzNhVTZMekFvTXpoZXRpTnpGamxER1FybjNoOFlhbXQ0dGFtWFhTTFU4?=
 =?utf-8?B?Ky9VRWtFbXhvbWc1czZxS3FVckphRUJSZExyeS9oVlZrL0I5OWtsSENpZTgx?=
 =?utf-8?B?bTRMZThuQU9STWJKYmMvdGF2RlFVNkxMUm5yL0JoNmFWSGJFTHc3MEdsaGdX?=
 =?utf-8?B?Wlk2TXI1c2wvdXdzSU42S282WFM3TXEvbGMzZzg4bjY3WG4yT2xGcVlsZzkw?=
 =?utf-8?B?eFczSzBZVTc4SGNIanNFUWhmckZMblF0c3FsallaRG9BWWY5bmdzNEd4VEZO?=
 =?utf-8?B?WGhpeVUvR3U3WWMzeUZQS2lTK2hJL3I4TGJpT1d5WmVrbkRjU1cvVkpIZHN0?=
 =?utf-8?B?cTQ0VG9QV1hFMkxseG16M3FheFdQN2s3QmR4QzN6cVlHM1dnSHFpWFpjN2Ju?=
 =?utf-8?B?T0xVYXVKQUsvaERhUVNxRDVUQ0NXZ3haUlM2eE1mU3pBbFpyVUZGbXdmblhU?=
 =?utf-8?B?QnJLN0k5WWkxRXZ4akNkRmZhMlNmY2t5c3hYZnpKbmlHRE5lU2l2dENlb1R3?=
 =?utf-8?B?aG51dEwvVy9IRmp4cWF4RzJzUUlSMWJxTVd5cjVWdm9kb2NnRlZzVG41TkRz?=
 =?utf-8?B?MUU0OWx1VHpyYlV0UE5Pcjhha0NoM2dXS2RxbWVNV2FkYnE1TlpaallNK0ln?=
 =?utf-8?B?VU04NDFoM0pmejNwbGMzNkxGRGtHanZCM2YvMVNPL3VJT3lySmdRWXdCRWxp?=
 =?utf-8?B?c3FQeUpIQ1p5MGtrVktCeEx0WGV2Q1o1aGZIcXgyUHZLM281SUs5RHE4R0gv?=
 =?utf-8?B?eWtuQVR3cDBKMVlWaVhqR3RUZTlzUkJTL3RYV2h3dUEyQ1RzODl4NVdmNndr?=
 =?utf-8?B?Y1NRUzBCT1gvZzBmSC9sblg1L2kzTlNzZStFajAwWUI5YkY3WmxqVHJSUXFL?=
 =?utf-8?B?VVV1YlBhZk10eXdwek1MTjhiREwwaHhkMGFIeldYQ09ocHB3bGFJS3BYVlEx?=
 =?utf-8?B?VmEvUW9tQkowNW1USG1DYlVDTksvZkpHYnVqQ2xiRk9ncmVPOTBia0EvNlk4?=
 =?utf-8?B?OU9yV1FLVTY0WXpWbFdXc3p4SmdLQmlEdzRkN0VpMGFIN1dWUzkzSCt1d05w?=
 =?utf-8?B?NHVqL2swMzBJdm40WWJqeGh3cVhzemxWcmpZaDdtYVZHZm85VGFFNXlxRWdr?=
 =?utf-8?B?bnhWZVV1V1VvVkUyRS8xaEluL2VtdjhJakVFQTBxelZqVDMrenBCVDZUd3dB?=
 =?utf-8?B?YmhCb0hCaHp3YUp5RzZMMlBXalV4UXZhdWdoeVhhT0xwR0lOT1hBcERudys1?=
 =?utf-8?B?d040Z0xMTG1kNFVHRWxmTjZadWwwanlDcGNCT3pUNGlkVmFSdVUwZWF3a2lB?=
 =?utf-8?Q?7Hanr3gNuThcmTPILCyl7uopdqFQkWDCGmUA7BC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5bdb98-2793-4d9e-7c42-08ddc4002a87
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 00:31:55.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6008

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo. This PR is the 
replacement of the old one [1].

Thanks,

Chen

Link: 
https://lore.kernel.org/soc/MAUPR01MB11072B86FA33FAFCDA1FD2D1CFE54A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM/ 
[1]

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.17

for you to fetch changes up to 8727665368cd4af112146b650ec0ebac038b5cf5:

   riscv: dts: sophgo: fix mdio node name for CV180X (2025-07-16 
06:31:57 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.17

Sophgo:

For CV18xx serials:
- Add rtcsys device node.
- Add reset device node.
- Add ethernet device node.
- Add support for Duo Module 01 Evaluation Board.
   This board uses SG2000(old codename CV181xH),
   which is dual-arch, RISC-V and ARM64. This
   patch add the support for ARM64.
- Enable ethernet device for Huashan Pi.
- Remove warning for mdio node.

For SG2042:
- Add ISA extensions such as xtheadvector/ziccrse/zfh.
- Add ethernet device node.
- Add Sophgo SG2042_EVB_V1 & SG2042_EVB_V2 boards.

For SG2044:
- Add pmu configuration
- Add ziccrse extension
- Add missing riscv,cbop-block-size property
- Add MSI/PCIe device node
- Add pwm device node
- Add SPI-NOR device node
- Add pinctrl device node
- Add ethernet device node
- Add MMC device node
- add DMA device node
- Add I2C device node
- Add GPIO device node
- Add clock device node
- Add system controller device node
- Add HWMON MCU device for sophgo-srd3-10 board.
- Reserve uart0 device node for sophgo-srd3-10 board.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Alexander Sverdlin (7):
       riscv: dts: sophgo: cv18xx: Add RTCSYS device node
       dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, 
add SG2000
       arm64: dts: sophgo: Add initial SG2000 SoC device tree
       arm64: dts: sophgo: Add Duo Module 01
       arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
       arm64: Add SOPHGO SOC family Kconfig support
       arm64: defconfig: Enable rudimentary Sophgo SG2000 support

Han Gao (7):
       riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
       riscv: dts: sophgo: add ziccrse for sg2042
       riscv: dts: sophgo: add zfh for sg2042
       riscv: dts: sophgo: sg2044: add ziccrse extension
       dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
       riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
       riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

Inochi Amaoto (21):
       riscv: dts: sophgo: sg2044: Add system controller device
       riscv: dts: sophgo: sg2044: Add clock controller device
       riscv: dts: sophgo: sg2044: Add GPIO device
       riscv: dts: sophgo: sg2044: Add I2C device
       riscv: dts: sophgo: sg2044: add DMA controller device
       riscv: dts: sophgo: sg2044: Add MMC controller device
       riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
       riscv: dts: sophgo: sg2044: Add ethernet control device
       riscv: dts: sophgo: sg2044: Add pinctrl device
       riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size 
property
       riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
       riscv: dts: sophgo: add reset configuration for Sophgo CV1800 
series SoC
       riscv: dts: sophgo: sg2044: add MSI device support for SG2044
       riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
       riscv: dts: sophgo: sg2044: add pmu configuration
       riscv: dts: sophgo: Add ethernet device for cv18xx
       riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
       riscv: dts: sophgo: Enable ethernet device for Huashan Pi
       riscv: dts: sophgo: add ethernet GMAC device for sg2042
       riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
       riscv: dts: sophgo: fix mdio node name for CV180X

Longbin Li (2):
       riscv: dts: sophgo: add SG2044 SPI NOR controller driver
       riscv: dts: sophgo: add pwm controller for SG2044

  .../bindings/{riscv => soc/sophgo}/sophgo.yaml     |   9 +-
  arch/arm64/Kconfig.platforms                       |   6 +
  arch/arm64/boot/dts/Makefile                       |   1 +
  arch/arm64/boot/dts/sophgo/Makefile                |   2 +
  .../dts/sophgo/sg2000-milkv-duo-module-01-evb.dts  |  76 ++++
  .../dts/sophgo/sg2000-milkv-duo-module-01.dtsi     |  40 ++
  arch/arm64/boot/dts/sophgo/sg2000.dtsi             |  86 ++++
  arch/arm64/configs/defconfig                       |   4 +
  arch/riscv/boot/dts/sophgo/Makefile                |   2 +
  arch/riscv/boot/dts/sophgo/cv180x.dtsi             | 110 +++++
  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |   8 +
  arch/riscv/boot/dts/sophgo/cv18xx-reset.h          |  98 ++++
  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        | 384 ++++++++++------
  arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       | 245 ++++++++++
  arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       | 233 ++++++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi             |  61 +++
  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 283 +++++++++---
  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      |  87 ++++
  arch/riscv/boot/dts/sophgo/sg2044.dtsi             | 499 
+++++++++++++++++++++
  19 files changed, 2041 insertions(+), 193 deletions(-)
  rename Documentation/devicetree/bindings/{riscv => 
soc/sophgo}/sophgo.yaml (76%)
  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
  create mode 100644 
arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
  create mode 100644 
arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts

