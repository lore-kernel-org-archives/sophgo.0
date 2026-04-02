Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011031.outbound.protection.outlook.com [52.103.67.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D903A9629
	for <sophgo@lists.linux.dev>; Thu,  2 Apr 2026 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132253; cv=fail; b=kkJpz1K56RiB6OgVM9A0ff+thddsV1IM2vcJxWBHSzQTpj54rrqSuKBz6HbLkRf41PShm2At73sSfpjUTAOM4TItCYdwjdAuQ258y2ygr6lpH3MU8QkHUakEfx/lcle9YO/8AU0ZQbu1xEYVAu1qiw8ue2Czxof/5hTMqpeELQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132253; c=relaxed/simple;
	bh=rYadevM4w4WJCyKjSdnTNj3x0UWOj9vFXi2sMHgdD0s=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=I4zfS+Z3xwSqK97h6H9QSFnDb5zdRfuNTq9kgSgv4z6MnQHlEZMKL+fmheCr0MH0UHkZ+Mvjf9YX8e9te6LrdFOJrUCLlAX/15mT7vKwBxV1WlJJEU0Y3bxvcCRKTpNn6pHMhZj3fvnC4UtPxn/Bp0KFPKWQ4b3ww58WukLcnRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hMglH4VI; arc=fail smtp.client-ip=52.103.67.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hMglH4VI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjq/fZTfZf5YSkj0ue25wD5sGXpGUnvf2Bvy1OUKtrVsfaoerfzxdha0XA132Eety7ilfh2NH6h5k7vbdXnD2g1FbnXz3RjwUP0m6xot27Mf9YpPGDihE5FXmH97oxS2NKeRHsPgSZzJKtWvQeREcGHrBbLsnxTYWuAf2gAdd9/Otm0r6GoFOo96RgCJ+uNymENs1fXKV1xfJupu15V9aKZEJh4xP+bqQq29TT5ivCn+oLJkb5mubHmjMNdP0LfKQ6HyrZP25VTtI0CFk0kPhkVuriJjejJ5th4iZ6D1S/t4l7T1uUyk556wMKx1t84FO6O+aVllTdyvc3mkO9BlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tWcRxrC20GMa6tbourObT4fPnGBI+4WGN2YnYq/AvE=;
 b=ull5DAi+NleYkKrlLQLfxJZgzaIO1jKDUrFXVZItbPk7Qhwc+rLeoUu304QxfLG+WanqV1YYvs3hZcKhYaYv6hH0mj/NXSLSQD7Iz8g33tnNIQGiSreYH9Zlag3EDcULi+s8vu5d9DHxI+Tbl8Ea3a6Vlnh1J3rsYKdO6rO2G4sv16zuKR1GWRHjmL519Z+3c5+nU6VMlf84o+raYXaF5d0SAmnEp0+FZGkgwunWjPmdrJnjNVw0qZ5IO4h2UyL2rHo3qxBfQFBfI4XKgEA3Ljmjh2vlnOt4E5fJQ4wxwSrAavMLqCTRcLxWodPWT4C7YeayNqrduFxIPJsaQBZ11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tWcRxrC20GMa6tbourObT4fPnGBI+4WGN2YnYq/AvE=;
 b=hMglH4VIMdJj6D0l7Z563JKBih0Kru0OkB5IdNwYcB4gCW+nTez8wEZSdVtyKll74LPrYF0h9YPzlYgnPLY/2CdA8uwMDPCpG8xq/14tYjZUJFb8P3B/yaMSFR+J4YCBrpXlSWSRC5E2MYj8aLqXK1GsuEFUXRoR7Z8HJYFmcQHDspksDEBsXsRx66POW9C3bThGWFVcjhdqnSh5ZXwOAMx5MDTKF1h8hg8k+jt0GP8nlH6m+yR9vL9wMHAKy9SizQcswIOJ6SQqhHaKM/mxGV6g45obFjVRp8zh6dG4QIRhpyWExoOCjXx05T4VZMmxKOokrfbZePkvsnNFH66KVg==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN0PR01MB9415.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:109::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 12:17:27 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 12:17:27 +0000
Message-ID:
 <MA5PR01MB125002FB79FF79D4FEBB02EE0FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 2 Apr 2026 20:17:22 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Apr/02/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::6) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <d5d2c810-ffae-42a4-88fb-f6ff72500290@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN0PR01MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 563d83e3-4da1-4731-ee40-08de90b1cdbf
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXZ5XHxNrJCjRnjimRBgM6STt09WYiiatfLoRvoHFedlpUXxIba2d07a3k9RyWC1zMbiXIQqMztacbm9wyfRr9vNfbY6YMRvcNs2pWMquVQKjUmmuByIUHp0eX0G+9tW8Od7Xl9qfmE/QlUYKGE4+HKX2NcDXmkx887xu5uMrgnys6eHo2xcafw6cZRDZN4NXyaqLbG84uiQMEWERwQTQVzrmgTjhcJR17xiuy3Fv4rKv+op73xNVBTk7shbF1D/urcxxPka/M1PbJhToA+4Loef6bzy7qLs5n9/NlIqNdM3a0RbrJ8WmQzvazi8MyeRYoqQGxAtpZAZCd2lqXEtNK+8c+uNwy7sK3b1FtAX9AyyKSVdKwCmddUkBWBGZx1EDF9MQizDtZa08siHzLqPBQO3PhpetcccqqOaVDlSaqtaei+BtwfUvWMm+5mycqdJScMwohvNNzmvZ7Sy4Pgsz54oWL9HxE8JCz2qDvB3dcJRcp1kSPAKogA/69mxC8lAsS4NopBm0F6hTrvvkb/AgKUdtylPSgZ8jw6BH/ZDZIQg0MERuizZpJ3K8UESbDda7r8B0px374xrds0DSqQXKsE4gQ+6vOYaOvmiqD/8GyPRDGq5+eBzlGrE/SDd6e3B7iIK/9kebP090c+Hl+biL7dmOcnL7icDn1dCww/9Kioq0me7sLDp+bb0SQAanBGnSulognkUbYzYPJvHqPwIMBJwjovNUNnuh0qZXzMlwH3xEJFTPp3SaTJaJtpl9yjkBE=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24071999003|22402599018|461199028|23021999003|30051999003|8060799015|19110799012|39105399006|20031999003|24121999003|22091999003|25031999004|5072599009|6090799003|15080799012|13041999003|1602099012|40105399003|35041999009|26121999003|440099028|3412199025|4302099013|10035399007|25131999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2xvTGZQRTF2ZTM0WGp3ZHpUZmx4OVFLTG96T3ltcVRXM29qa05UOGE3R0ZF?=
 =?utf-8?B?a2JTcFJKNVZkQmZreWZXMU9qNUIya2oyQ1FUQjl2bzBJTXdqN2lkalk2dDJT?=
 =?utf-8?B?eW9hcGNlRnR0Z1BIM2I2NFhQR0pUV1kwNDQxSUgzZXRIWGtYRncybS8rUTF5?=
 =?utf-8?B?bmNqUTFLaVZKQkpwY3YxbW43SXQzVTJUV0ZFSVhHNzdoRXI3N0FTaTIzOHdH?=
 =?utf-8?B?MDVjb0o5bW5Oa3FaNnlWWFExVmZFcWNHblNETnpQakptNVk2NzBrS083RmZK?=
 =?utf-8?B?a1Bvc2F6ajFVeVVkRXE0K28vRmthMDMwUm1SZ243enFLWTc1dHE5UDJJL0Zk?=
 =?utf-8?B?VUFOdFJaL3ZwWGNXNmVvNEU0RFRPWjMxUzllTGxXekZZQjJ6Y3Vud2EvU0Zw?=
 =?utf-8?B?M1hKSVQ4dy9pRE1Nb2t1cTlTdU1pYks3alB4Q2FyMHZoNXhDdWRWRmd1ekhB?=
 =?utf-8?B?MEtmMTBONnFPNllrZTBoZWpabVFBNmx3YmxyV1MwekFuZEF1dlhCaFdYOGd6?=
 =?utf-8?B?aE05QmVTRGMrcUtoRU44dkpFcWFPcElDa1lKaUZqc0pnMWhjYVZJRjVEaDMr?=
 =?utf-8?B?TzZ1TTdpSEFyZldaRFlUMWhia0N5clFla1J3dHJEK2xISHR2N0MwbUZQYnZy?=
 =?utf-8?B?VE9Obk5QbkVKVmlLZGdzTy9kUDhZWUUxYmtKYkw2S1hZMWhSS3BOZ3V0MFkz?=
 =?utf-8?B?aFpwcStCbG5xNHRZVU11L2JMUXNFWlRocUJHNjBGM0hHSGRJWld1OVZIM3JE?=
 =?utf-8?B?cjRxeFlKeHRUdkhMcncwTTFqOWc3SWVkaDk3bnA3TGViUE9XVkt4M1pHcVRT?=
 =?utf-8?B?d24xV1IyVzk4M2JERVl5VjJVWElrUXFkYnRsRDRvUHduNUhIQU9FcFBoV1hr?=
 =?utf-8?B?Nm1oSXF4S1h2WENkYVR6SVgyYmFoajdtOXI0TDA4Z1ptTGNNMFFnR1pwUHh1?=
 =?utf-8?B?QndTQktPSDBweTNndXQvMVN5cFExRGdYUjNjYUIyS1VFL01IdXFTZjNXT0g3?=
 =?utf-8?B?QlM4dGxXMGwvMnNiSWFrZEFKWUkrT0JJSGFWaXNpbmI2LzNEU01LV0QzRURS?=
 =?utf-8?B?NzlUckFrM0YrMDhBNWxuSE1nS2wyM3dQa0NYNmlmd3F0bGlydkhiV09CUVdv?=
 =?utf-8?B?dVc1N1BKU1ovWUVyZnhKUFdBbGVkQS9GRkZvS0VYY2RHZlNrSkFZUmY1YWtU?=
 =?utf-8?B?aGJNeGVYYUtjOU9uM3FzUmpjZFp1cmt5ZlFPK0NlVS81elpDSTJwbmRqblFr?=
 =?utf-8?B?a0d3Z2ZORlJaR25wWWlHZ2FIdEtYcDhDbnloR3FaWGtaeHZGYXg4K0VaN3Rw?=
 =?utf-8?B?dSt2bnZPOEZxTkZGYjVNVG54c2dqUFNhdXFVd3owRU05R0tvU0djeEJNT2FL?=
 =?utf-8?B?NU9HSENGb0pheUk0S3VGZlY1V01GV1RxZ2ZWZnlSbjl0UE1JallFWU5xUzNV?=
 =?utf-8?B?eEJsdFR4aHE3YkxNL0k4YllZK0JKY1Mzd2lML2lNZFVCYmdSMXhPSTA4emhR?=
 =?utf-8?B?YVRrWTllYnRZZCt3UGtwSy9hd0R5OTArNW5uWXlSZjdNVUpqN2pCWngvY3pN?=
 =?utf-8?B?eFNRZXFjTlRJR3BJejJNWnkzdEREczRiYVpyR2ZWYXJZaWo0QWNSYmk1WFpY?=
 =?utf-8?B?MTJadkhabXhabTZqcGJTM1d5S1NiTk9JMGh4a1p0UHhHc0pqL0lqeFgzU1ZK?=
 =?utf-8?B?WnNCMy9qN3VmaTlXdU9jVFhGQ2xwVTZWVGJTM0JUbG5SUkpWSEhBai9Db0ZT?=
 =?utf-8?B?US9Rd1dqZ3pkYW16OG1qRExoQ3VHTFVqajNsUTI0SGZ0YU54Z295OWNKdDBS?=
 =?utf-8?B?Nis5NTg5UVVuZm5rNEJUUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFRhR3hwazR5Y0ZHR0tCWUIvVWx2bU4zRFUvdEdHR1Bxa0tKRE9vNWFsMDBP?=
 =?utf-8?B?VHRYUVYvV1h2b3docWhYNmN0SmJBWmlOeGVjU1UybU5yVWNVdzIwclpkRUhw?=
 =?utf-8?B?RFUvSEVTYTJSMnVic1M5eHNoUlh6K1lkbzJCQ1FyOHdEV28vajdpS3FIbDJk?=
 =?utf-8?B?eEFwdnNxVzUzTU5JYWRYZFZLN3ByYnZzbFh6bGtCQUJhOHl5OHFhSUMxYmZ5?=
 =?utf-8?B?SnZ1VnpZMFdkVTRBRDRaazlKdFhKMFVkWHBtTk1ZMW1qc0U3Wmo4SmIva1BF?=
 =?utf-8?B?VzlHV29Mdk15Y3BqOXFnNDZhZDVEa0RjYjVDVFNuTXZzdVhYUEFnNUs5SmV6?=
 =?utf-8?B?eTlOYys3NFdtRTNTOFdpTW03VjBlY0YrYktIc3FvcGhzR2NaYWNvbVhZQkVE?=
 =?utf-8?B?aWJ4OUpobzNJQkVZS2dXQ285ZDhKU1p6TGRnYVcwMyt6RS9HL3ZwVTNGMTA2?=
 =?utf-8?B?c3FSSmkwcjFGUWhzSnBPMWhyU2czMVdieXVWRDBHeUVwcExBM2Q2Z1dxTDZ6?=
 =?utf-8?B?WVZHcUJ6akRyMEJScTFkdlZGeEgrWXF0OFNmOTNMV1g0NmswWHk2V2JqT25X?=
 =?utf-8?B?aDBqRVZpRVpRbFdFNzl2R3hlNGMydmlSeDNqazhjQW5RSUc2Vk4zMmNXamto?=
 =?utf-8?B?UDJjd0Jtc2xYcGV3K3pkdFNzSUZ6QWJNSEVOd0hPZHZqWmRCdS9BRGxoNEUv?=
 =?utf-8?B?Ui9DTmhOa3MvdkE3eElCZVNZdTVqanNUQkxhOUhEa2R1V3ZDdC9oZmM5WE9T?=
 =?utf-8?B?VXJXL2RKZnh3WHZwV0xZMzhJSzFtc3pJV2pNbGgvNDZGcmNZYzc1RXY2akYw?=
 =?utf-8?B?Sng2ckpTc29LcGtuUlJpSmlNcWZORjNLN3B4UlY0ZmIwNWpZZkQ5Q3NSdVlC?=
 =?utf-8?B?TE5WSlFQN2NrS0JUK3hmek5uWStidnlyai94Uk1vUmJSckVoQ05ZNERkaTdI?=
 =?utf-8?B?Z09uYVE5R2VuemlkQ1h4ZnM0ck9qQW9CcUYwUkdISHFScjBRY2oySjFZR0ZY?=
 =?utf-8?B?VXZMSUhCNkVpS0tqdHFNbVllQTR1UVlmOHE1d2dSRjExM2luSGE3c3JjcXpS?=
 =?utf-8?B?Q3MxQ0I2cVkyVVlJQnVuUDY1N3Uvd0pMWk5RRXI4eUI1enp0WFQ3dGhCeTFk?=
 =?utf-8?B?dkdnNUdaOGppRnJ1UkluRlFLc3NldWN6b2NjK0MzMkcvRURhSEdaOHJvclJh?=
 =?utf-8?B?WEVXU2xaWlpqNDFvTldNZWE3a01kT2phOHljRVR6U0JLak5qVnpRN21qV1lG?=
 =?utf-8?B?cTJ0cThzMDlDUE51TjVzNnF1WGhyWjNXdE9IM0JjUjZ1aVZDUGNaaXFZd0l3?=
 =?utf-8?B?UUlCWGEwSlRrUjNTVldrY0hReVgxS09sT0ZxUFp0YWxRUS8yekFJTFJ6bjl2?=
 =?utf-8?B?dVhES2VRNVpGelRuUVdRUDFjazZLWEQyVlJoeHdzV0ZtU0xJOFVhMFlVL1lk?=
 =?utf-8?B?cDRrWm13cjZwenpzMzBGZjl3M0NWQ251Y2t5TmM3M0phdjRiQ0lqT2x5MWM5?=
 =?utf-8?B?N3lsSXVzYVROUlJObGRPL2YzMG80SzY3MFlHUHB6Vk1HY1RHaXpGZEZGdmVo?=
 =?utf-8?B?S2hFUk1WWFo1VDN3TFlqaGtPc2ZiUEdTcGRhbjA5THMwVWQ4MmF3bUFra0pZ?=
 =?utf-8?B?VEJpV3FRSWt1K0x5MUxKM1VmOThreFd2RUQ4L29DTGJNTE81cnhaNDhDYVpv?=
 =?utf-8?B?VVdRUnVFSFlyUStzQU9ZRkl2MmpyNm9vWlZrOXFiTW5nOGw0RzZGVFEzWFJk?=
 =?utf-8?B?bTZ6cHVsSm5wNUFlUjYzWjRHaUdVaUk2QjBEZVpvVmVzcWFDTnI3RmEwbFF1?=
 =?utf-8?B?aW9paDBMcXdzSytNUGtyd1E0eDc2MXpiVmZyb0s4V0RFRUhqd25idWJVOWRR?=
 =?utf-8?B?Q2FtdTVuTmd1MUs5MXQzZ2d6VUJ5UVpoUVZPdGpZcFJ1M0ZJU2N2RFNJOEFY?=
 =?utf-8?Q?pFTa/wyLdPIcattE6fNtAsq2HIydDd1Z?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563d83e3-4da1-4731-ee40-08de90b1cdbf
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:17:27.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9415

Linux Upstream Status updated: Apr/02/2026 
@https://github.com/sophgo/linux/wiki

     CV18XX
     - Duo-S: updated to v4

     SG2042
     - PCI/sg2042: Avoid L0s and L1 on Sophgo 2042 PCIe Root Ports: 
Maintainer provided some suggestions, need rework.
     - Enable PCIe DMA coherence: v1. Note this patch is raised due to 
firmware(fip.bin) add new features to make CPUs and PCIe have IO coherent.
     - PCI: Allow disabling port services on broken root ports. This fix 
is common but was found on SG2042, so log here.
     - pinctrl: sophgo: Fix SoC module in the module description string.

     SG2044
     - pinctrl: sophgo: Fix SoC module in the module description string.

Thanks,

Chen



