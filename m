Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011033.outbound.protection.outlook.com [52.103.67.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EE31B814
	for <sophgo@lists.linux.dev>; Wed, 19 Nov 2025 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537073; cv=fail; b=fYA9bXfO5kTHptn5O9m3//Q+RvboFr0BQ9JSrbuCkbESez/HcG27jPAx2Z1cEvaTAHVYHLJh2bPYOBrfrw0Yw+vplWmwDzO/JZcPw/pNpFuBsMV0cXwNVIuKkugMrR+bBemjKw7rnRUv5ECrAtDB0WNx3TzHKJZjcvpHbQeUeCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537073; c=relaxed/simple;
	bh=pyTqrMeh5RmutztYV1666FZwAZXlFhLXZTKG8jYiVgA=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=tQcFkQn4OOIgDuxSXg2m2wJazWKEMfL19L22g/G/vPKCdryYQSwyPw2078IKtc5qT1psHufPYmYLCsXPLiXx7l6ip10uo3jyBL0gEPl8C2xhVO2Cewi8dVHIXeimo/vs/Oos6XNKaXLJcVTSUT3iy87PGT4zv7rh+anLfXHC27U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=l6sBQMKV; arc=fail smtp.client-ip=52.103.67.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="l6sBQMKV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtpDoJhWzdGtjmQkk7Cxl+wUPehOWfSJCgOOY82zg5XdIpW5KUk1A40XEhiEaEjGAwSzM3P9zmxTUK5tjvHOqC+SRWGkiFBXiSlFsYVa9jezaE0dVFLP2HXiQvc/7J1gBNU8L6qNWVdz3WMSl6CKSSLlQYw0Re2iGjza0wwTTkYrLW4ViPo1r0/Etmro9eKTTdimXe+WVMGpzUY+wIcbvOb7Gs5O0yumeYUfy6GWEpQ+/k9dpG+Iw0pkR7U8OuLMwmsARolWCHVkOgUe+wwNOBgZ1CjEnNxRH/prAUaThWyL9FalAnSmgzzfWyCK4aBYqRMzjQop+AUpnuxsLt6g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNuL44HrdXqSmIvmgOa3V+FD29y+sTIIOAioBM2ycKE=;
 b=naDgCJi9n26GgWMjenKFyW6+q8bs8nLZL4i4pZbM1I//NpeiMv0Z7kDKM08OiVl+xk4JQXq5MbqUUWZEcNs/V478ulUoNOM4gxhHLT6/rB3Hmk+r8H1hw6dk0PcRL9pZZGUr80pZjqgR9AXzhzy4baf5/ccNpbcolwfoLYBg2okeMUp60PCTaZPYVzzeMK+vlBDUzXDZ2rsewLdbjbfSDx72WqzSHc/0DajuHA2ooK0eRp/bhi4c4X9H0JwLGGId26sFNOMVbft5GiNBAE7Kb0HGoYzvkCVI+pujRuvMTOFoJe94hZfs7fvgL5/Jg2Kk8hLURJ8pZHmoPW3Fd3ZsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNuL44HrdXqSmIvmgOa3V+FD29y+sTIIOAioBM2ycKE=;
 b=l6sBQMKVCwLT0caErztjFOnhY05zswqO+X2urRFE91mf/pI+sp/MmnMiZSAl679/JOIri5HC0zrFOsaBkXxMkZlg/WgSAeB9EtjdR+clIjgGuApZLjMfB7fYCwcus/uTCwOGA8jFhPjtJ2hQ1NrYBfVQHhFx2jb4jR7bE3ntVVJpmWpg686miZpeHDFX83We3f0hMkWMiMTeVXbDZjmP55spEhbq/d77HMTfDItotpMglXcJo2zXi8E+EjZd6NxRPOC4ExEpSkb30qp766MatcSN+lkbL5/MUIynWSm/jehNr91kMn6Or/NKS4K92QbinMD38lqHBtYrXavCcINTLg==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by PNXPR01MB7057.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:24:24 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:24:24 +0000
Message-ID:
 <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 19 Nov 2025 15:24:20 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <unicorn_wang@outlook.com>, Zixian Zeng
 <sycamoremoon376@gmail.com>, Longbin Li <looong.bin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.19
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID:
 <93615a35-2989-4162-9f1c-dcbdd4671c6a@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|PNXPR01MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 5285d9fe-bf9d-44e0-1359-08de273caa44
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TWnHr2aTc7oye/bilYJDP7yfsIDR2Wg9EZ1PUFgVmNwRWXoo6HLAnUuN1zc0CkZbj7jOE6wAI3Fq0jgSut+ZLTARY3+FBnsVcHYnwB+o9hGOBjFcQcxvsJTdnQC+QdpBe9/f2+2kOiYxyk8NCkTJrF32Zqqm4u9zS13+GCRFzYMWsiZQnu3NpmvbOR0aE4xdJ0ENvS559V8SqtPNkq+ojWZHaYG9B4WxIIw0Gjyytux3UO0FSuqCe3yZMwdzByPbPaII19nyQhDP/46IZiuqZTn+xsO8QEq45XxFfembNwz4wOYEJWuc2d1qaui2ov/7mJshZERsfhpD4fUEKkbetQi6PN5mnuAZ6rBLP/3UId8+BKo8zCOxNw4efdn34ETIWLjYpbCK1hWDVn+DyuW8cBAjRpWAZrm+CGyVQSALELqrFizO3wIrxFHpPosc+hcpflrx9obJcr6DnxZSmi6BB3B/I0eTbWCVeoxyaDUAEUWIBMMELH8iVh2Pu7jGzMw8HhYrKjXA7DAhw2lV4yL11BqP/yncjWMabI2qOPYHhKtyN4TgTZLujGz0pGas4aO1jPdKOgq6kZFaRtDwpAxYY/26p7+Py0hUL27YMyowpptkeGOlnehidengZmjoUPj2lNWbDf8o+SMMF3oSKTajGHuJvS/+J7Q9jqBz6gPxKv8H5fFhA4W2muuLa2RafuDVmyBh+7wJTYXtL6G3G01DgSqKzG8N+9gSYa49NQRi6I2T8XQiX6xldLtUg2nyPzmDqdO1oLciBkPgBZ7ajU24Qw0Qh130qUkss4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|5062599005|19110799012|8060799015|15080799012|5072599009|6090799003|461199028|52005399003|40105399003|440099028|3412199025|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVVxRzFFYS9xaGVUR3lEcVVoR1RDYktSdHFaWm42WURjY0FUMm9MNVJ6OTIv?=
 =?utf-8?B?YTNrQTc3VkVLOTBZQWJ2cGN4UDRmSEMwR0lEK0RIck95MTgxMDJEY01SQXFB?=
 =?utf-8?B?WDVVUElmR1p2T2lLV0dkZlBHcDI3dCtYNGcwVTh3L1lHMy9SUEQxb3JxbGpr?=
 =?utf-8?B?Rk14TU80UngvM3VYUHNsTmpxTGNnTkpoNnM3Z3l0VHRCdWE3c3lSYTFvQ1ox?=
 =?utf-8?B?aFh2ekdmeG5zWHg2c3oxRFZRV0VCbHlTQkN0L1R1YzAvdnFNcy92WWpaSWpS?=
 =?utf-8?B?SGVLalFZaWpBMUI3a1F2bUVuR3MzbGxET1lkb04zOGNyTHl6TGpPb24vRWtm?=
 =?utf-8?B?Mk9VLzNYZkRId2VCZy9CNXZ5dWNibTBlMmd6c3dTeHk3Um8vQ0hxdlN1N245?=
 =?utf-8?B?a2c4enE5Y3BXd0YwM1FnM3V1WlY0S1c4UHM2S2JSTzBydEFLOG5nSGFsYnI5?=
 =?utf-8?B?S0M1cFhIb3orZFlranI4UkRSNFlEajdxcTlDc0F6RjNaaWFLTFNNYzlHN2g3?=
 =?utf-8?B?Z1d4L1B2aEszbDVkbi94Wkp2Q2s0OWFhZ1VsRUpZL0pZRmd5RmNDdHhoam9T?=
 =?utf-8?B?d0pWRHpVNXdqeTM2WXFzczhsY3VEdFJwangyUEtsK1haS0NGaHE5cHFkSTNT?=
 =?utf-8?B?RkgxQmlBL0hvbXJlMTg4UE9Od1Y4YlVIYlVFVlVYd0FMRjJXNXBUSTNFaHAw?=
 =?utf-8?B?d3JZY1lIdEZSSWdYRmY5R3ZiMkVQd0lZaVh6dWpsSFRkUEdxaHFPUDBqc0Ni?=
 =?utf-8?B?YU1Va0tlVnQwaXU5bDVjaGlwOUpRc0tZd1FMbEEzWFhnVHVYeTNvUmtjNXIy?=
 =?utf-8?B?QVdaNnVZVjBIdnJlUUpwNm1mUVhpZ3NRVEI3cUZaT2N6amx1R3U4S0JyYVNP?=
 =?utf-8?B?aFdyaFF4UG5XVWJVZHJURkE5QXZibFJra0VUcFdSdjJPeGkwV1I3ZGJzUjNQ?=
 =?utf-8?B?YUZOVkxXWEVxUkpMNzhzTW1NblpIYkJ1K0k4T2cvaXZwL2J2cDF5Qmx1REZL?=
 =?utf-8?B?ZWZ5MTdGMC90L0R4a0VNb3N6UFNoVXNUUE9iYUNyYmVMMVhoYlBVaEtwYThn?=
 =?utf-8?B?NGUvMWxEWFFPKzIzLzFzMldrWklvS3VhcnFVN1VrWm5mOGJCU0p4NVpabmRM?=
 =?utf-8?B?NWtaL3JQdkJ3cVNUVjlES3diOW1HSlRCdXNqby91eStUWHFNM2xJRCs2eHF3?=
 =?utf-8?B?R1FoWVNLQnRub0tlZG1leDlSRzZsd0ticEZNUGdMTS9lRlZ0dmU1aXJSZUk2?=
 =?utf-8?B?ZnRUelNzZkNSWm13bHJTTnNNbVg2NHJvK1BOWmRWeFF0TFZlcGRNZDBrdzVP?=
 =?utf-8?B?MzdZWlVNaWJVa3U0ZkpVaEhIN0RIK3RCY3Vwdnl0TkNtODJZdDEzbGhoTytN?=
 =?utf-8?B?NjE1TE1RWXZCYU5uaDA3UTRuVEwyWUY4VVdBSkJpME55aExEQkczMVRhOXJY?=
 =?utf-8?B?SEZYWUlpRTNvSW45N1NaazVQMXZzSGh0QzZ2TWJ1OTZPZzZheFp2Mlo3SVc5?=
 =?utf-8?B?dGozSzhFVXRQNHVVcDlmUTFUZXR2SkpjeHlwVXJZVlMzYmRyZ1BqQzN4Z0hO?=
 =?utf-8?B?M2lZTVNwWTZQWThRQmdzSVp6SllJRkRMY1NvYk1FRVR1dWNRWUVTckFua0ho?=
 =?utf-8?B?YjlRYktWdlBURUhuZnRoNnkvdVFLZ0oxeWZSQVRFNjNuS0hRcU1SZExsZDMw?=
 =?utf-8?B?OU9DbkJBSmRnUFZBSjYwbEVJaWJwV0lVcytHdTBNNGgrdGVFeFFLUzlhL3lp?=
 =?utf-8?Q?DZG+uIj27PeVqeLxSM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em5ZdXZ4YitGa2ZqQU0rRUJwdWpTUm92NGl3WVJDV2dQb21FUllQNkJwa3kw?=
 =?utf-8?B?WVh2RytaZmhQcldhcCt5czhESDJkNi9zbkF0TUx1aWhOQWZ6aDZ6RXN6OFBh?=
 =?utf-8?B?WkhNR24yVHV3RjcyTkZLemNmdU9Hb29XNGQzdDhUQ1VCQ0ZDTlVTOEZ2bXll?=
 =?utf-8?B?S3plOVZMcmJEcFo1K3VWdWhHdXppRms2cmZtN3NMeU5tVGNlVk9GUHByY3U3?=
 =?utf-8?B?Y01WZm5ic0pXRWFZenFub2tnV0tmbDZLTVI2bW9jc0h6NndYQWxNcGQ1SVNv?=
 =?utf-8?B?K3hwMjlJQ1RFYVZGMHl0VFI5Y3FiS0FaVVZmSjJEVWxBWFZ6MWVhTXB5NStM?=
 =?utf-8?B?aytKNi8zSFpPT2oyYWZFa3ZjbnROQlkxVGRneExhYmFYck5CT1hRZTIzMG5n?=
 =?utf-8?B?dk04L2NTa3hpYmVHY3NkMS9xcDJCbDFaQ3puNnpOUFNRYTFGTlZ0eGRtL2pG?=
 =?utf-8?B?emNIMC9CQ1J5YXFwVnozK29qZ0xheHFkTHRCWHhkODg1b0hIT3cydnhpRmd0?=
 =?utf-8?B?ZC9PS0hkeGlHQUxZd0kxS0RDOENnMGc2NzNIWE44elhBTjJnTWwwVDdWTm1Q?=
 =?utf-8?B?aGNlK0tGQ1VidGpjSW1GSTNkcXl5RldOUlVzZm5PWWc5L3VsaHBaNnVCTFg1?=
 =?utf-8?B?VFlZVTc1alB6OUF3SzYzU1kvRlZwbWVXTVQyZ1ZhN1RENUswOXBaU2tIeWdH?=
 =?utf-8?B?aXlYUUJiNFJlc0d6YTQwOXVSMjZYRFg5aGZycjgzL3FDTDNJVXc1U1NCMXJG?=
 =?utf-8?B?Tk5EbkVUWUlHNHFGMDJEcFJTakxFUkNmVUN2YXZObUpkVkQrelRncFdCVm5O?=
 =?utf-8?B?UEJJcm9NajdtcmdhNlFDbkFSdm9RcVRYVlpYOG5XSFN0QW45TXlLMmVYKzd1?=
 =?utf-8?B?M2JhZExzd3FCYUp3S1JXM3VpSzhxdDZJMUJwTzdrZGJMdzc0UkczeWx3czZP?=
 =?utf-8?B?NkFGWURPVXl4VHdXTHJ3LzJETkU5RWxVU3lmakpSWlNFb0RDU1h3MEdRMU9h?=
 =?utf-8?B?SzNQcDVkYVNGUEUya0xxaDNkdk4vRTBPTVdVUnJGcklTQ0VVYnNWQ05HSDhh?=
 =?utf-8?B?cTB0WmxSc255L1BKdHZ2VmN0MERWdTMzS0FHUTVITnV6WVRtdjFaUzJWdWEx?=
 =?utf-8?B?dlphQnZ6cWlWUTJ1N2VvQUlPVFMvRC9uZGNNRTFiZ2J6c2lyRWh0bkxyOUZS?=
 =?utf-8?B?OW1UOWZZTm0wdVJaMTN6bHZab0dFM05KR2RhQTRBcW1hS3pCYi9aZ0hENlJu?=
 =?utf-8?B?SnQvbHdFZjljbUpsb2tBbmxtT1NueDZEelZHSmpsbkl0MmtGRnp1allheDZ3?=
 =?utf-8?B?WkNPVG9ybldLQ3owdTFkc0RmRnoyV25WcGV3cUlsQUNvQ2paMHpQZ3o5WTRi?=
 =?utf-8?B?YnlZcVg3WFlET21UaU5BWWg3WUN6RzdNellsczNLN0tLdm02bnlPSHdPYmFa?=
 =?utf-8?B?K0I2Qit5NkNMTjYvUXhJNTNuTDhkNllvQUphWGV6WjJneG45N0VmRjNaK3E4?=
 =?utf-8?B?eU4zT2hWMkoyTnlzZ3hRaEllVVBoNEFKNEVJWGVsRnZnM2lWN09mOXZkYm9V?=
 =?utf-8?B?OEFKbWNEQ1gwbUFFMGZ3TlAyc0twYzBJZ1NlNUZXN0VrVUFCd01URzE3cER3?=
 =?utf-8?B?anR0SzBJN0JkclVJZVhiV2lrT0IvNFpCN3hqcGFVYmFrWU96WUxqSVNvWncv?=
 =?utf-8?B?MkpWZ1pxbi96L0c3NjFFZHI2QWtCcTNDTUw3bk1UZDhxSG9XWG1oMTdLZDJq?=
 =?utf-8?Q?pumz1aDtf6APwq733JyIumDXsJnZdtw28shX3gk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5285d9fe-bf9d-44e0-1359-08de273caa44
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:24:24.5141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7057

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.19

for you to fetch changes up to af5eb17ff893bf6e52680a31059e1816749c2d20:

   riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2 (2025-11-18 
09:17:55 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.19

Sophgo:

For CV18xx serials:
Add top syscon device related DTS change, the top system
controller provides register access to configure some
misc modules, such as usb2 phy and a dma multiplexer.

For SG2042:
There are two changes. The first one is to add DTS
definition for PCIe controllers for SoC SG2042 and
boards such as Pioneerbox/EVB_V1/EVB_V2 uses SG2042.
The second one is to add DTS to support SPI-NOR flash
controllers for this SoC and the same for related boards.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (4):
       riscv: sophgo: dts: add PCIe controllers for SG2042
       riscv: sophgo: dts: enable PCIe for PioneerBox
       riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
       riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

Longbin Li (3):
       dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
       riscv: dts: sophgo: Add syscon node for cv18xx
       riscv: dts: sophgo: Add USB support for cv18xx

Zixian Zeng (4):
       riscv: dts: sophgo: Add SPI NOR node for SG2042
       riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
       riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
       riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2

  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml      |  80 +++++++++++++++
  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts   |   5 +
  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  42 ++++++++
  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |   5 +
  .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     |   5 +
  arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       |  36 +++++++
  arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       |  24 +++++
  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  36 +++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 112 
+++++++++++++++++++++
  9 files changed, 345 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

