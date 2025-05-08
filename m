Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010011.outbound.protection.outlook.com [52.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E64FC0A
	for <sophgo@lists.linux.dev>; Thu,  8 May 2025 01:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746667927; cv=fail; b=WA76gFlntnWUgeEUXh91CcI3FzK1PCP1sKSNDogHvTY6gcCKsMG5IdHlCkkInqmwJdSBXxED5tdXZPiseLPfP1kNFlwWN/cX7UmzMVU53upxLn2aBe0l4nnzY+qUmltXaQVm/CFGRm3WtGW9TFnCSEDshpGcENsqSfMb4XwEkrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746667927; c=relaxed/simple;
	bh=JFO9PzVXDFnSdN1Tn5FJI4wZQUu0cLEyITKV7zIf5wk=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=cavaNmhznhxaQdcQ5DOOozmyWguYauZdHIBpjT4gMvcu89q4P2csh2wwCC+N83IfzvXUdLQ6bfhMNHegFMFvqf3nj17ekMLNp+srvv8HvvHcLpYQmdU3DgF19v9F2WxMTrxiRgiHbgACQ9r5DSlrxoJJh/dMuDdPJfMI9kuYHt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rPZP1qub; arc=fail smtp.client-ip=52.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rPZP1qub"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNLdfNnch3xBDJSO7u3p8/Z3JOdNV50rt2f/jikos/yOY+7wZc8FFm+ycRfR1mF5pXxQb/wce8DmMBBC1yJjmheLPP6P01xmaPDjijbnnpMQ1vAsbRAAX8DM4yxXFOln4XeYx56DbeeUX4KmcWOliDDFsUGc6tUAjOUif3beqvLkAzqpzrm1sXc0revQQEux2KBf4+FcoIHLd5VgnwsPcD3vktJsteOwDF/ldD8OXv/FqafNznH3huHlc7rpkDch0CbLuMKuFrXEWqGcr5AXxsoFs7R8q/NwdZB+brhcDujs6UwbeIT0NRIwfRlulhvM9CFYHSd0HIKOi9ZaqGt9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFO9PzVXDFnSdN1Tn5FJI4wZQUu0cLEyITKV7zIf5wk=;
 b=WqhHAP5eUbAZek8tdLnSPwtc3+v0+/wlO5XD5FqXK6qfzt0Twfn9AUkp+rjdyZ6YKxrKO572arQcESaxHwi2PpMW0ZOYJa3h3kfPYCsXsMqcLPvTuFUWZJ/hmLSe3/30bLqu/vpyWMjw1IluoQ9o9JxM8uUXeh6EwFZq9YSrYDpX/DAxrV6wNwIGaYe5w/DGN8paV77ccyfhMkEwr1quOXitJvwf0mdi8cteoIBGDdOK3yQeUMFtVeZqBPrKMWKxPzZZ7SyqGoZljuzctsw/xNjNopYQYlXmEypa4CN23+MrW/l1OudSa6FnkqobVun5NLCga61gH03SDI3bk4+iIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFO9PzVXDFnSdN1Tn5FJI4wZQUu0cLEyITKV7zIf5wk=;
 b=rPZP1qubcEX5FkDq9IDER6tX1a5PbmjQGfQWUPPcgX8y9zUwQZ7hE5xERzpyoOcmzfjh1PkfDXJTeEIPTdZNuKuTdTZPxjXDEfmZzdzrG347PcRa9Owd8W3Yfp7aHL3qaCImSDhY2WBD8MmTYYCcVTTgnEmJHWN9teOuD7RsKVibgvcbaZ78nFGPYY/q5NbQyWgFOUTO/iNv1PF8mv1rJS47r/XySkS6dY5ntExTr6HYMWNBiETg5oHurMLCZ5ehhoMiT1tHQ3v7wUmSmNVwa5PB21NtIjns0fu8L3dgzG/3MnTQM6yW4K5REQT/Hvq69F1/pQK8yHeiAM9FtX+RIA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB1188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 01:32:01 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.018; Thu, 8 May 2025
 01:32:01 +0000
Message-ID:
 <MA0P287MB22623FD048FC64E08EBE17BFFE8BA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 8 May 2025 09:31:58 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: https://github.com/sophgo/linux/wiki updated: May/08/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <99ab035f-bc23-44e6-aaf5-2004eaf5f5fb@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB1188:EE_
X-MS-Office365-Filtering-Correlation-Id: 552a2ac7-edfb-4a42-3f97-08dd8dd0215d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|22402599018|7092599006|8060799009|19110799006|15080799009|6090799003|5072599009|1602099012|3412199025|440099028|4302099013|10035399007|34005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzBDcnJ2dGZLTlliUGlqbnRLTWRkcFM4TEI4c2NjRXpDVnFYbnpVMUlsSEFq?=
 =?utf-8?B?eHhPRlJ0UnN3Q0JIbWlqMDIrVzhLRGtuekladnhUeEJ4c3VSS1hZa3JMaHBP?=
 =?utf-8?B?SXc3enA2YXdWK2hHSUUwVFFRVGpxU3lrd3RBVmhpSk5iWnlOeG55d3VjK2Er?=
 =?utf-8?B?c01VcVJ4WHRqMXZRSUkyZ0lscjVMUXZhcnN6NHRHOXYrN0kvQnVTNk9YR3Rh?=
 =?utf-8?B?NzU4OVJuRzlHOWticTVRaXlWVGpDdnU3eUNITG8yVGlJaG1BVHkzekNYa1V0?=
 =?utf-8?B?T1d3a3Vjd3d5bmZwTFNzaEUyMzZ6T1l5VUhZL3VZQ3EwNGRpYlR6Ykoveldi?=
 =?utf-8?B?eHRZSnFVYmdYZjBmUmRzcWgxMW5DQXNZQ2NydlI3TW9uZkRqK04rU1hRTlEy?=
 =?utf-8?B?dGZZdDIzVDhzcmprZ2hkeGM2YncvSndoSTl3SkY0TVJHQ0ZZSDZDaFA3Zk5U?=
 =?utf-8?B?ZmlnM05oZ3J5NTNzejJrWG0zcnJtTzk1SXRQNFR1VkN1M3RCTjR6U3gwNVk0?=
 =?utf-8?B?c05OTnhaTFpMK01jZHNNUk9YZ3BvWXNhRUh6SUlaQ3Jlc3lhNzhzZ1QzK0I2?=
 =?utf-8?B?TDI4dFY1NThnLy8xVjJhQzY2L0wxQXNtOU1xeFhUYU8wL3ZKU1dMd0xjb24r?=
 =?utf-8?B?WFlIcG9EaE83eFVyaW1IQkpFYmc3R1V5QUd3MVJPR0Ywc0w1MGFZZ1hObmEy?=
 =?utf-8?B?RFN2QUNRTWgySFc1SkkxS1NHQVVyTjJmVGdhcjFuTFhhWTd2ZG1xcFF2QTVS?=
 =?utf-8?B?UExBeWRFcDlYVk1WeXRoTTNJYnBkdGlyZStMV0lKZzhnZ3QxbnRMNldCeWQ2?=
 =?utf-8?B?RzJ5UFFoWmNTaWNWRGIyVmh5RVdOallEZzRtZW5rdmxIN2RnY0RNUjFZV3VT?=
 =?utf-8?B?QXZrSVJnT2JRVzFDQUZxdktqOHR3bWJXVjZPcGJ2RGhUMHRYd0Z6NXhBMkJ4?=
 =?utf-8?B?RGZ2b3hnRkRmUWVWRGdLOUVHZVlLblRDeHpiS2xnNHdhMEFRaWlzYnlJcTlZ?=
 =?utf-8?B?OFBlTFU0Zis3RjBrZzFtN0I2L1RzOU1EYjhVNVhub1d6SnlJN0syMWZWWXRX?=
 =?utf-8?B?UVlvcFFGVUNIUTB0Y3J4WnQyWklEem5tdW5LKytRVWVQYWVLblQyQ3poZDJh?=
 =?utf-8?B?bDRRZWlIdVNVRGNlRzhKN2V1cTF6MU1vbUF2QmVzRmVOTHVqdkVJRjBaMHJX?=
 =?utf-8?B?V1QwSGhJanNXQnIxcGw5ODBCRmFkNVBoSDVkbmt5T2VWY2NxcitqWWljRUp4?=
 =?utf-8?B?UkY0b0FiMk9DKzhEaDBiVXVFNU5zOG9wS0h5bXlDMUN1cG5LMEZndGhhc3dx?=
 =?utf-8?B?NFlQVitFaUVJT1ovQjNzZXdFOHFXSXdxL0VGN0dVU1dlZyszbVIvTkJZclI5?=
 =?utf-8?B?YW1leCswK0l5OGs4QVFIRWJWNjhaZzUzMzFQbTlMSnhNdGVEc1Uzc3UrWkZv?=
 =?utf-8?B?U1NtdTVPN0c0bU5LeE5uZG5KQlc1M2NIV1JUMVNGUUhNd3pDNGdla1N4OUc2?=
 =?utf-8?B?NFkvRENRa3lmc2MyaWlsWlR0Z0E2SEFaTU00Vmd3TXBxNUZkVGJUY2ZRc2oz?=
 =?utf-8?B?SjFpemhRRDlVWkxzWUc2eFhDVEtlcE93MWIvL1NFTmxyRi9VSG9SNFhTQ0ls?=
 =?utf-8?B?bEhVeHZqMzVWS3Q2dWhZYlNBM3ZQM3ZDSS9mKzNxRGhwYktNR3BMTkIrOXNY?=
 =?utf-8?B?eG5RUXlwUTkyZ20yKzkxYW5iMGRzekdGakNvNGd4cnNmUS93WUJtWGhqZ0Nz?=
 =?utf-8?Q?Pg8do02umSrDO9tlps=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnJkWXoxazNvWU9rT0hFZytXUWROOVFuZisrYm0yclZOT2ZLeGV3M2xjYnV5?=
 =?utf-8?B?eDlaSXk1cktCb2IyZSs3U0pDTFNIOXZLR0REd1RSRTAxMU1HdURDemVxYS9J?=
 =?utf-8?B?dWU0RzJSUllONlZjWEVqZXV4V0JRTlJQTWJwNGN2TUJWenM4UzVWT3Y4cTU5?=
 =?utf-8?B?UnU3R1U0Y2NXOTB1SlRhYzh6U3NRd0VRTUZESE5uR1RuSmxHdUd5SHhPNkVa?=
 =?utf-8?B?OXp6ZCtoUW1saXFTY0xQQ0ZOdGJsaVl1Zkl4S3ZESWpSUHc4MDk5ZWI3eW9L?=
 =?utf-8?B?Sm84aFNoWEFNOS9mRXRxb3l4d0FBZmtwY0ZXNVBrZE05djIwb05Qd1lEeWdx?=
 =?utf-8?B?MlExVXV3OTBRTExveGoxbUxyV1hNa0hISXhYSWVjdk9lcXVNR2IxZGhDS2t2?=
 =?utf-8?B?S29lMERUcXluSzVNYVpjREhrblRTcFNwTDlMSkdWTElHVFBuaHdCMndiNmtF?=
 =?utf-8?B?TDlBRjFjb1YxZnhPeVVXdHBTL3RzaDlhR08vTER0aEJtWnMzTk11QmRwT242?=
 =?utf-8?B?V3dCb3JyZ28zcGZZQisraW5nWEM4YVE3Rktnd0JvOFJPYWhUMHhnS0tCUGw5?=
 =?utf-8?B?K0ZITWhTLytEamh5NkRSM0krbXl5ZkI5eGxXUjhIZ3YxNGk5RXUvNnVkYlFH?=
 =?utf-8?B?SnZOOHFQT0NhNStTWGFQZGFYWVdoVGNySk0xMThOc3l2QU84TkRnMDZya2lN?=
 =?utf-8?B?SlkzSE9qN25kaUgrcXFuNlJPNzM4Q1hCMy9nSGtIQTcrUWo4NytTeklsaEpK?=
 =?utf-8?B?VVdzeGxrdGhHdlBuWVdBSUVRVVNlWU90ZzNBVWNseFFQRFFsb1JJYTZmd3FG?=
 =?utf-8?B?eEtyWXExTVpCWDJNTXJUSGE0OEtkNVFMSUVrbDB6ZWhsUktFd2hHcy9rTmtD?=
 =?utf-8?B?UEZZODllZWlneDhpeW9nZ0tUdDlsamV2UVBEUkxPQkkrS0xRMkExK216aWlI?=
 =?utf-8?B?SUkyZ0lvdFZXM2pSVkNOMFY3YzlmajNaL205dTJEYkNQN3lneURuSEhKSUR1?=
 =?utf-8?B?S2xSS0sxRkt1dlNlRnk4NlJTdjM5YTkwVUZEL2dtZE1PWHZRUnZIVEt0Qzd5?=
 =?utf-8?B?Qy96cGRXVGxsZVRoUTN6MUk4UzA1cmNWZURPMXRvUk5Kc1djN014WW9nSHZC?=
 =?utf-8?B?MHFQV3R1b3A3ZGtwcGFxWVhVZ0FjcFR0QVl5TGVvdUFFV2FoYlh1bERMaGJr?=
 =?utf-8?B?dlJDd1BqOE5NTzVHODVGV3dhQUJsOWtVMXFXUG5KQnVYenJOeDZmM3JmUzdC?=
 =?utf-8?B?WlErb1hiNVA3cUlqOStyYld5aEZ4d042TllzZWNTUVg3WXE3VlRJRlRRcW1D?=
 =?utf-8?B?eEJXd0FqYnRTbXI3ZlgxbmFYVS8zQTQ2NFNUYTVlS2txUGpTZVlicUZFNGd3?=
 =?utf-8?B?VUllNG8rL0V5SlhVMXBoVnNKeUt4b0VMbXhiTkV2VWxGYXNZSmZzNVBnMTVO?=
 =?utf-8?B?QUZxTytsVThud2VyeUM5aWk1aEZmcTlhVm5OSnRIY1pCSDUrMFVZRlVuZU9J?=
 =?utf-8?B?VXdSaHNYbGdrbDhsdXd6Y3NLN1A0VVNYRWs3NHozeWh3MjRlbFV2ZlduOWhl?=
 =?utf-8?B?S1MwVXZIZUh0TlU1dmpGV2hjcnFnZ2tmK2theDJmTzlnbTNWcS9YOGdGOGx6?=
 =?utf-8?B?Y2RBWlNLWmxYWGlkc0lFYThoTk51aThvYjNkZlkyOUFYMFlQKzBkZmhVWk1i?=
 =?utf-8?B?T082R1pYaHR3cEJkbDVZTkdvbmhIcjVIYzY1Y3ltZG5XeXFVYkZtdkcyQ1hG?=
 =?utf-8?Q?Xvj+0D/8UqOXs2MxPRIUpA19/6YHbsO1f1NUvRq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552a2ac7-edfb-4a42-3f97-08dd8dd0215d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 01:32:01.2282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1188

Diff:

https://github.com/sophgo/linux/wiki/Home/_compare/fb8cdd6156badfd9aa00c588100a87e121acbd25...dfa5cc1ab93758090d99427cee4a3dbb41177164

Thanks,

Chen

