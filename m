Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011034.outbound.protection.outlook.com [52.103.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3DA1D5147
	for <sophgo@lists.linux.dev>; Thu, 29 Jan 2026 00:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769646842; cv=fail; b=RSyZx2kJdgpJhp2JDE4EBR9yZY7L6Z3MnWwDZIM4d6OWWkWFQURB629TfN0tXc7BcX+PMSEn9HkIyXw9wcF2v7mhtWaEL3kxUl8JzT/NiVyysUC9Iki7ug7xhte1X0ec8mTWXdK/PSi4vO+1oyCH4SxJ0ROHybFjn7pRdRnLo1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769646842; c=relaxed/simple;
	bh=IweOFS+E25ZDh+TxkoqAZCZnhYXeGWp0kJH8eoD2R3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rlwQWVGeVeC8FESJsf/EVfiKF6rNxbjXmkBJUG+h5OEb8Dgi0e5nfFhuy4c9LUMDU9FKikDYa72WtswLHjbWQ7mGbP1Y7CbqaA/q9csA6CBqEvIla2slocmUI3qZUguu1FENZCt15E1EqCmfkZLB/W/5LBo/fVCjBG7eA1/3NM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GQqydXqB; arc=fail smtp.client-ip=52.103.68.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GQqydXqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AE95u5NT8soETH8N4hDpSfB65JH5WodWzIbgohnV/ZhjLj7f7bX19SXSPm8yYwhhQhfey19SLQAfe+v6CYSbxkmqjOK/z4PKrYggTJChsxJt+c9e2P6//KUF6KDKddQUFCacZahOsNqWQKn/8iA2kN5jMPAqdkIjVwMWHUfazl2sSU8A3up+nxB+9SbI+Y2bhwQFa+7BGgo6PxEkUdZlqdqXbeqqaUd4RG/3DDXpgVGGbvf//xTDgZUTNR9ev2GoUlncVBKEbvWTcgoE21qUPZfJrDf1I7ig+AbXgalzBiT+kQI/6B9UDw0viZAeCCHs8yNHvXmYzxTQSC5taYK8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqYkDUTGTzB5msl5pCwlHKo9pfuctZ23YInO6NJUSpg=;
 b=FbQTfK6e0a2P46R42ilvMPp0kAxxCkJ0OJ1Ss+VqOd0PtC8RC2/Tcx5WJSTdOl9ko19puamii1oZNLTWUXq6IzYxnXNAQTrUWLRg6ZD6BgH1+3AoeszGnk2cLhHu6o9xi3j3btU9atmx0HftNLeR0GLczh2Wz1L95aTtPuZB+WSOJok1Y4C8dZZbFq49zvMU2YakXn4eSY0ZS1IZRmep5SWYIRoaZG6gwp91GksKZ5rqPqLI+nnI8xX1wWsMs2NJAdmPaim98N64q05LvvR9Hm8xnpyvoUhbJruW4MdSWsZbFlIbf1We9J74qacVhPqyl+W0/DpxFfodFI4HF20Law==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqYkDUTGTzB5msl5pCwlHKo9pfuctZ23YInO6NJUSpg=;
 b=GQqydXqB8wDDJlFymdq02Qi8KQ2YyOP9uOkXbX9BQzybor9r5++bJScG7SO2MhZwQ2rcRsCFOu9x3T3Bjba+VVrCv5Xx9qdeCvPE6ziEjadoOCgnDIjD1jZSZOB/WyeNxkAjfqv+YwX6FLBemUmVZbmbZbb7SjITa34PlUbatdScNKFRDeeW3yt4Aj0hYiwjuc4C9vd0dU55EL0EUbbCk2UJxnw8Nb6W1JbxjAFsKwniA4U1YExJmkmgo/lQY7IgQO3yycpQlF2hhRZNhNP3/zxPO+frDpM7vXOqjZBzfmLONV5OSR+wLNdzf5i/TNebhoE02XgAi5GKe4lJI9ipSQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN1PPF00FDAECC0.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::305) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 00:33:54 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 00:33:54 +0000
Message-ID:
 <MA5PR01MB125009818CC3F8C36C602B83FFE9EA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 29 Jan 2026 08:33:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.20
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 Guodong Xu <guodong@riscstar.com>, Michael Orlitzky <michael@orlitzky.com>,
 Anton Stavinsky <stavinsky@gmail.com>
References: <MA5PR01MB12500D99CB14A37FBA543DD36FE96A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <22023b9a-2a5b-4552-8d9f-3f15a7cc2ba8@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <22023b9a-2a5b-4552-8d9f-3f15a7cc2ba8@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0085.apcprd03.prod.outlook.com
 (2603:1096:4:7c::13) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <90fce928-f7e0-42ed-afbf-095cb76d5cde@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN1PPF00FDAECC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b236471-9396-410d-e66f-08de5ece1408
X-MS-Exchange-SLBlob-MailProps:
	ynsnEk/J89dW0L57jKMjYHPVlex4PDSlBUMgmITpyhEGCDumXZ4pousr2ho/YjhxC2fKWgsRY0N68mtpHgorQjxpDBIq6p4cPyLBfu3YL0vMTl6QozZOP4W3AkCeglE5oac3QfvbF0tGswLy2gNck60ksugxe17Hs8SnlEt8MmVDecDKDvIJNSbWx2Gfo6TilQ/pHOad372FF/vB5637rH0aRNo2Ay6zsctzIcH0QDED3PJvSKqwr9QkrkTaZl3Cz9JkswAvLv/9HzEfaImqKbbns4y2kMilkXSAEpoyjfecmQR33WIKANujh4RLqZAvA8DAkMTMXw8iQrQv5IwsNQ10BvkXBdBnft/7hOBiM+ndiZho5TRm+ni4HCcOB6W14YCaj9ZDQe36aV1pZjLdVw4DbFpUiufD5Z04BuFhDe9nV0xYFBWeJF0vpvVtYSlwg0btjDYOMqkWjqU0fe8iiU2iO4EeFTxRHizuhMlvY6wKNTl6wzRX3oCaYHPxDaG2f5/MFN7pAPfghDVbmFvvXVNPslqI74LxBvvCwWT7rb+WituT+9MS9p7TXrS5mPUuUr8kmwyU2gP65Daz+ORRRlH8uIPgHamsaOYfL4SM2SBX+DGdVcxeOfip+bbJLdsEPiXCYYadYTp0MsG3kAM0n1k4IxGi7tbvVYR4toUb7tYJUypLUdlPmAgEHLrVnYzKyBqfWBhzaJFuB0U06SkOGQldfOGtws7EbcJuRlBknlJreM+Tuu4eFfeXemyooiDYRqZjcxwl1BTIZ/br8swQRuM1oH3ujBiVF2hGX/aY88mdM33NMwtxAA35m5s47bJLwOygGjPa7ydWHlF2VEDLC/OT3x6fgfdhi4VMeqyVaPZGIHJrCBc+wOVHMi706imdqbpHLYk86QyWE8hKs/C3zw==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|461199028|6090799003|8060799015|15080799012|51005399006|19110799012|23021999003|56899033|1602099012|40105399003|440099028|3412199025|10035399007|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTRRRHdOYnJvUWlHOUZ5Q1Bkb1NqNUl0UDlSVDF5QllGTVp6RjVwK2twekI3?=
 =?utf-8?B?Q2JVT3Ixc0NqTGhrT1h3YWoxclhOVmR4Z0hWbWFxWmhvSkNlVjZ2VS85WjFQ?=
 =?utf-8?B?N1RCRkRoQ2pucWVYcGNjclNOV3ZjRVRNb0FLUXg4cW56Wlk2bU55TTNLWkhr?=
 =?utf-8?B?bTF5YkR5aVR5cTQ2R1h2ejFEVm5xZW15djBwTysrWTJBdmx2RHNUaXhoZjc5?=
 =?utf-8?B?K055WmNBVFRyeU9KaXRsUDFHalB5MnNxZXc5MjVGSkpwUnNYRzUvdkpRVy82?=
 =?utf-8?B?bjRURG5uZHhmQ2xic29zR2J3eG1La2NRdGV2SUlBQVVjanNhOWxyZFppcERN?=
 =?utf-8?B?c0VIREUxa3UxbmdNaHoyNGtwZ1VENURrVWl5SDU1dVNIejdPMG90NlRBZWRY?=
 =?utf-8?B?ZlRDSFlaQ1oyNFVyQ0FQSGd5SEJ2Nm54bzc3WkVzUXZjVlVKcWV5a3Z4eXhC?=
 =?utf-8?B?QXJJUVp1aENnM0l2YTA2amdSbjdla3ZJZ0k4U283UUM2MEFhZTRGOXlIVDBX?=
 =?utf-8?B?aHEwR28va1JjcXVmZ2RjdzZUWDJIYXJYVTVEZFJ6emlBcjJ6TEVxOXA3UjUw?=
 =?utf-8?B?dW5CTFM4eTVRTkoxeHVWcFVuNTh4dHE2M1pONk5hVzY0akJLTnNQUEN2TWQy?=
 =?utf-8?B?TFRzSXZHUHVkbnBXSzk5cmFhdVJYeUQ1TFdDZkNvZ1JMWDF0WHVLY3F0ZU5S?=
 =?utf-8?B?dlpGcEtHcUd0STZRR1lWZlpxUTVOYU4zUVhUK1ZaUEl4M0d2R1NzenNYZGhy?=
 =?utf-8?B?OXdLY1NGRTY4ZU11aE4rdWc2WklCRE82b0JxaTBqQVZKWHI1T3FVM1VzUEtO?=
 =?utf-8?B?L2J6M29yTm9VVHl5QWlBaXhuNTZjOXNzSjVFZFFRd1YyM0h4YXJpM0FhdElS?=
 =?utf-8?B?blc2TGVGRU5FL0hZaUpwUEpIRHdWUUcrZURiMWxJdWk3UVdJeDhhOG5pYXUz?=
 =?utf-8?B?R1JJYncxTUM0cTA0U1c4ZFVuTGVYdWxKdFNTL0JLS0V6bEFudWZhNEE2bTda?=
 =?utf-8?B?V1h0d3VzNlJHV0Q3Ny9mTXBNTjc1Z0pwTSt2SUVNc0tyaUQ2UXlFYy9DV1pL?=
 =?utf-8?B?NFdqU0VVbjRCUG9VWGRObWdRY3RoS2lQY09yaUU3TkpZRFdnNFhucWE1dHZy?=
 =?utf-8?B?K2pGcjhTZi9tV2hTMUc0Z0Mray9VVDk4cXJnTzZzbTJNWVQvMUVSQjgzTWpv?=
 =?utf-8?B?QmJnMDc4bDBvNTdoWFBEdjBpZXlaaTRZRXB1eDhhY21RQ3dIcEpsaW9QSVdx?=
 =?utf-8?B?NGoxcWVWdk1FZFFKV3FXbm5GeGU5RElhc1M5MnpyMGdkNFJXMS9MeDlSWHpL?=
 =?utf-8?B?VHBvRGt3YnkvSEtrOGpXWGRaMUh6RXlMY3Vianp4L1BndUVObmFhQlZBN3pk?=
 =?utf-8?B?SHhmU1NMYy9QVFdQSjNQOEJGZkZDOFRqRHJuRXF1NnBPRi9DbDZYdEZrUzMx?=
 =?utf-8?B?RHkveFFuUkkyK2JjYnRHQ3hhVEh4NUFjdW16OS9mMjV2N1pERmxPRklocGl3?=
 =?utf-8?B?WCtmV1FvdDdidjE0UDgvN25uWDlpWWZTWk9nUERLejcyL3ptQkxRR2Uvc3dZ?=
 =?utf-8?B?OTBxQkVZSGlSaDNTOFNjbHJqZkFZaU5PWHZDRVN6UDgreUN2MHRpV25xL21p?=
 =?utf-8?B?dkc5R290TGN1QUo1NnlSd3NJaEliUDZjZlF1RVBEbmdTYXd0bU1FNzR5N0sr?=
 =?utf-8?B?bG15MXArL1ZEVVpkbTVSb2o3UytJQ1RjTjZRWHF1ZlN4bUJpOG1IWnNVcnNw?=
 =?utf-8?Q?F6HP+wQ+RtwxSCi8aY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEpEc1ZYRFBvR1lmdHBOaDZzTWZWWEpyUm5FcEIwblNqSmp1dldaRzdJeXVB?=
 =?utf-8?B?MHRwU1RjTUZEOHplS1J6MUFhODdjSmM5Z1VUbnVaV2hVTXhzK3prNWFrUk1o?=
 =?utf-8?B?YW84aWxEUkdiSGNIdVFaUGU2dVpYLzkwdENNNDlFMCt0MWZ3N3U5anVER3hh?=
 =?utf-8?B?bGprc0VwT2ZHcXZwR0NIZWVtZDlwUmVYUU1RR3pFaklJNEFrQ3NGY0hFNUN6?=
 =?utf-8?B?T3VycHEvejIyZjVybWM4b0M1N2JwU05ON0R3Szk0RlBUcXZueFZCVmxzVi9p?=
 =?utf-8?B?cnJVNzVXZno4UGFtVDhmcnVwaE9Zb1FSeHB4cVo0NzI4M0Fnck1FWDFDNElX?=
 =?utf-8?B?TVRZQ0FnSUlwQUtoRmhJdlZ6OE1leklXWHUvVHJJOXJJNk1BN1NMSmdLbDVO?=
 =?utf-8?B?K2R4TmVjVTltVDgveVdKWFZTK015V3dwR29CSjA3R2tseHJJMnFEUjFpajVR?=
 =?utf-8?B?M1VhOElENDY2Rm5WbDdPTjdlc3hPY1NZM0JZdGZ0ZEp5Y1pmTUlmS0huR1JZ?=
 =?utf-8?B?YVREc1hpZzNwSzdqS1FZK3FXbDRNLzN1WjY5S2syd1JTblRucVhyOVpPWFJi?=
 =?utf-8?B?YVRWQ2F6OEFnL0lldGptZk8vMU9OaXQwZHI4S001TCs5cEpaSUJUL2RBSFo0?=
 =?utf-8?B?d0hEZkJaTWN0UGphc09QUVlPUlZuUjRveVhsTmZIcWdITDNyNU5qTXBMeW1Z?=
 =?utf-8?B?NEE0cnB5RjgwWTVJaFkzSGdxcnMyMVFseG1lM1RBeGZZb1NidmVzV2d0OUxS?=
 =?utf-8?B?WjFvMkhlaFNKcEY2MjF2SytJamlaV01RalB5c0JpRHZYd3plTTdyTitaVUhO?=
 =?utf-8?B?Wm1OMmZLNXZOTmlMdEhFMkljR0IvV2UwRnJrNXIrL212dS9mamorZGwzT1Ji?=
 =?utf-8?B?WHZKR1ROSUtWY3ZaUituQVdDSTFUT1BqNkhUZjlTOTBDWFBHRnpYWjYyVktF?=
 =?utf-8?B?U3dvOGo0TFlGaTBtaVN0WlBoY0QwU0RhMGNBY2U2bnNzV0hjWjkzdHFMRXZK?=
 =?utf-8?B?Ly9qNG9TUVFzRThRaWQvYkJJN3JTUlE5VTE2dmtSMXNqL3JnS0tTaHE3RFJi?=
 =?utf-8?B?M01idVQ5d01Va2xGM3NnanJZdENtMFhGYW1PY1lTbjlBOGVVTWNqSkpxRklo?=
 =?utf-8?B?QVY0SE5oRGk1MVM4OFJPMTRQaFZWeTdnanBGd1MrRzJmMkhQMERmRCtNaXdU?=
 =?utf-8?B?aEc2Ym9VUmM0RFk1cmxLeTNUODdpTnNxL2pxSWthdGVid29CSUE5UE1yOSs4?=
 =?utf-8?B?bGZMWndFRlc0eVp6TXVJUWozK29DdTE0WDNNMnh0OFdIK3RXZ2lob3E3Vy9J?=
 =?utf-8?B?MTVTRGM3K290UlhvbmVwUXA0eXBNRmk5YTNxcjArSG9wWm10M1BtVHA5TWp0?=
 =?utf-8?B?R3Bob3c5ZkdaRGJKaWM1MnNpZ3hxQmpiRGtaNmlWTUF0N1hvM01XOFQ3NjJQ?=
 =?utf-8?B?VGlLaVNLWm1EaFVnblpMZjlCQVY3ZG9wTlZUZnJyWmt5RzlkWjNPUVNYaUtM?=
 =?utf-8?B?RDlieVdITFRKemVjRU5VTG1rWDZZSzc5aWtmczhTSVV3YTZndmVXTXhGdGJK?=
 =?utf-8?B?TnYreVB6NGE4NnRkV1dzTE9qd29wV3pqeFJkQnBtazIrVlVNaEF5ek1MNEpH?=
 =?utf-8?B?ejdUcGNmQThlSjhtSjNDdHhhckJLVUl1TUtqUG5VODBOQkR4TlF4bk8xK2dy?=
 =?utf-8?B?VDA3YVkvR0t6dUZuWWpXVHhWVTN2SzI0YnNLbXVSREl0REFHZC9GbWpjKzF1?=
 =?utf-8?B?bDZBVlE5WjhpbXYyN1kzSCtYT2Z5dFA5RjVLdWw4WFFONTRBSWVFUUg3d3Qy?=
 =?utf-8?B?ZDBsOWZ4UUxEV2s5NzZCVis5dDZJQ0UyOTJFQ0ZwdnNWQzNQNHZ3cURwUXFW?=
 =?utf-8?B?aWpMbVVyckp0RHViNFlQaVQ1L2N6TWtEdUhIcTBTM0NtSW1xMHQzMHg5dU4r?=
 =?utf-8?Q?nOCUR/FsGaWda23jtBHMzczr8FuIBgu4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b236471-9396-410d-e66f-08de5ece1408
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:33:52.9490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PPF00FDAECC0


On 1/29/2026 12:55 AM, Arnd Bergmann wrote:
> On Wed, Jan 21, 2026, at 01:46, Chen Wang wrote:
>
>> are available in the Git repository at:
>>
>>     https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.20
>>
>> for you to fetch changes up to f16ae81b80ca4e721f4c4ed1f28390115f7721eb:
>>
>>     riscv: dts: sophgo: sg2044: Add "b" ISA extension (2026-01-20
>> 09:03:37 +0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Devicetrees for v6.20
> Hi Chen,
>
> I noticed that you are using a new gpg key. Like your old one, it
> does not seem to be on the kernel.org keyring, but I actually
> found the keyid in a blog post you wrote at
>
> https://gitee.com/unicornx/tblog/blob/master/articles/20240623-howto-maintainer-linux.md#%E5%AE%89%E8%A3%85-gpg
>
> so I successfully imported that key and verified the signature.
You're amazing! You even found this! :)
> If you have the chance, it would be great if you could get other
> developers to sign your key and upload it publicly, ideally on
> the kernel.org keyring according to
> https://korg.docs.kernel.org/pgpkeys.html
>
>      Arnd

Okay, thank you very much for your guidance. I'll try to do it.

Chen


