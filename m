Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B9202F6D
	for <sophgo@lists.linux.dev>; Thu, 29 May 2025 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521730; cv=fail; b=ialSMS7sRD3gcKOKFNrTu3CFc/a3Jc/W08Z+mvAtkNdC3ZYUSAPrNLWs6NPtxlXxBAQcwgJKUJZ1+xoPiBMKPmOVQCR7lcb+IQ6HOpH1MVIFs7s6TXUhnmfT6uuKn5z0BinqyQABygJ2U7nJ0Rq6Hx5aL9HfKzEqsLr+RHGw05k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521730; c=relaxed/simple;
	bh=sY/j3Z8m3bLqT4xqMCTtq1ErD+Bbrx3eAK2+ZebWqss=;
	h=Message-ID:Date:Subject:To:References:From:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=RS+mT4x0uuYBX/J44OF6cNH2h5MIBIWc4+h3pOlk2giupO2/UTj2Vk3uz744oRMUydYFj6Y7UIxkaOiephBKKYmheoUetu9Dm2XMfqSSWwOeBc6LHttwNzUf1gOgi6rbs1grJMHPdGrMvVgiDLjrJTxebaK6NB+HfR1LA/+2qts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QL6wzn9C; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QL6wzn9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQioOcWqn/OSStW5K3mpVblU6sqknT5fRVLmULxmNY+Fqzid66euXX3S6j9JCf/EcmYgPh02mINnGw3/smsC2IN00V4GXDXeLnzQlcecnGHF00NiSXUXiY62sITdw0Q4xQWBqotKXLZYx0qc85NHahOMFJZs9EW0Me4rIywD3QvMNKF7377zsAe1C+fs0Nt1hUG+qbbBGNDIq+6iG1VRkZsAZdeq2IPxXRds9YmLjVw56G9L37OnOwQpYP+SHJKy/kSf4QD6KEDjK6saFBBx1btSNVu+s4XVM4yWPB3u13LHJsoPPsRiWllrJlzYWKgrolkxYHDTiruo8WcVh9U40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aFKRnJM/X375/YveZ+Spbd5OWEbh2ZPHLoZyCUBaLY=;
 b=YoiNf5+WlQcSF1IdivtkUN4jE4Q5Yi94at67oZjT2h0UhvmWSDzVZa2RhMcDzN8ahdjc56Gds/Q/SciMacfCKZdWSkkyZpyoJtaU6rETRYKwPrEmXvsgKtBs5wGHwVdwAgVBxhpvowsT9PVv+IeIAuKwWR4Rdi5Hdn/0QujTLegaTMQsqjfJ0akasr0VGCU7EjZvmHfhnmOzkfMid6AF/A3N+oatPOa8/T23JbR8L2b8OvdimwbLHf2b//fWZBBL92N92k1QDELB94OF72qHhNPANCGZkyqjQoJHbM95bn/G8Uj2BzX/3fgOr4VFtupcNquoLkhJ+vhfnu6Mvml96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aFKRnJM/X375/YveZ+Spbd5OWEbh2ZPHLoZyCUBaLY=;
 b=QL6wzn9CcLa24nGR7WHUrKlA4bNe2aiULw/K2xSxITJlYl02eJhZxH0qGMaYNiLrDQViWefHZTyJdpA9HQLbD6mwg7jTnxnSSv4gI7W0oDGNGux5oPgLvWQsxsXNLwxPODY1qfDnX2JhLVbinK3u5BWhNAysYsfWFjJppNBlhRmRqW0PagPMUvanI7/bISTId6Xu0q8RoxFmYXS7LivIS2t9bteZqVyFQTofOXtI/K7OJOWs4LGVcc6me0cvW1Ml64u2KGUB62TkqG7Um61S94hNPOFmDoegOxZw6v0ob22EwI0xLZEP8tFozrLGDqqAuumVAxbVRl4Kg+ZJMcaF4w==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0236.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 12:28:40 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 12:28:40 +0000
Message-ID:
 <MA0P287MB2262607010D2B13CF862EDBDFE66A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 29 May 2025 20:28:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Taking over Milk V Duo S dts development
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
References: <3rBV0kNeG31FR7sMbqhrPU6Pt01dDnlBPZN_ihjbrqMSrP-wZXpuRJ1glIhWGdghF9OX5X6HNJ-D7X3_LQ4vZuAdL01n5ZHShWOx7wEt93Y=@bamelis.org>
From: Chen Wang <unicorn_wang@outlook.com>
Cc: Thomas Bamelis <thomas@bamelis.dev>
In-Reply-To: <3rBV0kNeG31FR7sMbqhrPU6Pt01dDnlBPZN_ihjbrqMSrP-wZXpuRJ1glIhWGdghF9OX5X6HNJ-D7X3_LQ4vZuAdL01n5ZHShWOx7wEt93Y=@bamelis.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::34) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <122d6690-a64c-4a4d-bb7e-c12971617d52@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0236:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fde7176-6e32-4641-171f-08dd9eac57c1
X-MS-Exchange-SLBlob-MailProps:
	gMiuAN0LASIScjX/aS/OnauL17RJFM5JcaR8Nm0urE61kd3uJetwUzMa4PfkPZObBlejl4jsqUPY3JwToue8Fhvr6wtPb/bVLA8+noEY6XtgEkSh6ysMvkLOb67vl09Ihgr1LksynFK9txB5wTRTTkkmklzkfbhd7d4fnLs+3NFW544/qElkOXj/Dd+tMxKdGKwEvlAfdEKgBqfEZ4a9p3JvjK8RzahTbMoTDTEXLjV/AMNMw2zlQGeX7tc2tj7WQjBwnXwZ3gAfNyUahuN2DZPQTaZD1APZcVYH2yOxwLu4svAqG/Z3e/ppTNdkXBuBSNzOgP+YCrWfF5geLcC+6VPznnxFeIU4kUGugoumBk8lRF8FJrB08c+bTlyYkJUrxdfzhU4yxYIdrkgOG5ACBD82J6lyKZ605IW51EbREM1iKmbBU1CoFcoOVGEb7h19Dnsf/qewEKMw5eikglQyLPsiBaQe9m1Rbs3PsHHV0kgAjDIX70Xw/yzT8b7aZfc1YWXU+c7IUWURVwWDjP1h7lLBppJ0S8HgBiNp9L/MO5eTcwL2eARjX4/8y49oVWDYWhIdiQA92p4xZnXv453+eXIxOXf5JBw4CLA2Qd8Ucn3cUn/AshhPvfjY3F9ZvPV8lucx670Z6Zb9yXDTq1Q1ewZLNdE3njjl2ZdIYbXY7QA425vq4Oi8NnnrlePav5Upeh0WD+DSg1gfVT52zh7SEg==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|15080799009|7092599006|8060799009|6090799003|461199028|5072599009|3412199025|440099028|56899033;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czlCOXJBYWJ5STBNa3dYaGd5RDB4M3R1Mi9wRU04UG9xZHNDTG1JTUx6YS9F?=
 =?utf-8?B?UE5sblJReUZmYlUzTWRiTERwV1NIOHVGUzIvUzUyMTNvQmNGaEZmVmY1RUwy?=
 =?utf-8?B?S0x2czVjV25RWHFlSWIyRXdYbWhHL3I3QXVudFdsQVArayt4SmZUM2lKYk8z?=
 =?utf-8?B?T0dObTRmMTh3ME16alJzMnBnbDcrdVI5N0d6TUJWZDgvKzhEdXhLbXVwd0Y4?=
 =?utf-8?B?SFgwSURMSkhrUFg5Y0hGMjRSbU9FL1JzRnk4OGNSN3VnQ3dsMnF6SCs5Vmhp?=
 =?utf-8?B?bWhMVEZKZG5ldFBBNHFGQmNOYmM1K2lyNnA5eWZjQ2VES0oraTdNY0tLeDNu?=
 =?utf-8?B?Y2FrM3FzQ2cwaGVsZGRCdUZWaG1aVFJseWFuSThpd2RGOW5jd3Rxc0lMdEhS?=
 =?utf-8?B?T2d1N0ZMbkRYaUkzcEFCYmM5MjVhSEtTMG9CTmQwS3lNT1FzUmlFckhYaHhI?=
 =?utf-8?B?aDBiaU1XZEtCc25JQk5qbW90NHJ6aFpyL3FORldOS2xMUG5qVWNVYmdhS1FL?=
 =?utf-8?B?STVnMXhtaTJ0Y3VlNFRKVGc2cW84NW80ZFF2alFiU2diVUZVV0lMOHBXak5s?=
 =?utf-8?B?Q1N6SVM3V1ZPVEc5SitjUWMzUWpkTXBOZUsrVGcxdjRPeWVsMm1LMWx4bFBq?=
 =?utf-8?B?RVFmdHFlRVlaUGxFak1SamJMeGVHSnFULzc3ZmFjd2lMZDlZOTFoRkdxZ2p3?=
 =?utf-8?B?eU9IZzFJY0gzZVhzd0RyeG1Nd1JYWGdseE8yQm0yMi9SbWhKT3B3NmltaXN3?=
 =?utf-8?B?S0x3ZWg5TG1xNncxZHJlQ290WWgzaFJrdThFQjhhSTR5ZFBzTVI3alo0YzFJ?=
 =?utf-8?B?N1JKQUFWVGR1MWNFNkt5UHdLaE11enVvTlZzOGk0SXNVVEtycERRbTh3OUJP?=
 =?utf-8?B?QjM1Y3lQNUxmTTFRNWEzMUJJOC94N0IrdUp4cG8wWitvQXFTTm1IMEF3OU1X?=
 =?utf-8?B?ajN0NC9CV1lCZ0dFZmlIRTJUWVNwbWZXb3h0Tnl4TmM1NWpZUCt3OThFRVE5?=
 =?utf-8?B?bzNPSEdxL1F3dVVaQzZvdHBIb09DcHlsbnJPMGJqLzRUVkcvSGVYK080eW1S?=
 =?utf-8?B?OGMydUpXaDI2eFoxMFo4SisyK0NubkEzQVZxM24vNGY3R0UySWNZOWRITDhX?=
 =?utf-8?B?NFNKTUpKS2wxWDVLTDBsU3hBZUF5NEx5cHVZMFd3OGVycStUOWlxekFnL2c5?=
 =?utf-8?B?ZWZCTkxDVWduaGlubmswaHB3VmluWGlVZXdZWUtBLzI3QTJSVTl3ZFBTZ2NE?=
 =?utf-8?B?RFlTVHIzcDRuaCtRWXhJUWJ2Z05LbEFSOVFhaURwaTh2eDllVkdZZFRRRUI0?=
 =?utf-8?B?Ulo0eWpjWk1xZkw2SUJyaFRzZHN2MGxUY1RrYlF4MFJ4SVNER3lNYkp3L2h5?=
 =?utf-8?B?UjlXSmROYjdFOWwzcFVTR1Qvd2FRQkJBc2RiWEQ0aVo4RDlQcnU0QUdjNzM0?=
 =?utf-8?B?RWwzRUtMRVdaOUxud3NMTnZ0REZwSFhIaWw1YnljWjdrcCthWFVhTFZVT2Fk?=
 =?utf-8?B?NnhNN1F1U3oyUzg1bWg4RmlGck5TVU8vaHpzRlRnT3hhNXRQTlhTV05PUXV2?=
 =?utf-8?B?WFhQUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdOMzRFQ0tYQXprbUFOU3ZQdG9PblVVUVMrbWJrcXFSU2VKd3lxZ1V1elln?=
 =?utf-8?B?TWxXR3YrZERtUTY0QVBNMlM4Nlo5L2NPRTkyRExabzFXU1A0bFIreWdlQUR0?=
 =?utf-8?B?MlJyblluYms0WjVHTENvRXZvMERBaHhMQTZjRzhXVHRnLzJqa1EwRmYvQmc0?=
 =?utf-8?B?UnE2aExJSzhhV3UwSC9MdWJ6cHdHR1VrbTZFSzZGVGRwZng0Sk81dy9nVkU2?=
 =?utf-8?B?WU1RSlVJeXk4MjE1L0R5SWJiQjNueEMwTHlaVFVmVFNybFJRLzI2cGhiVVVx?=
 =?utf-8?B?U254TVJWdThVYkVVWkNqNUtZcGw3V2xaazVxK1hMUzFCaWM4SHQwRE5YYStC?=
 =?utf-8?B?djZNTmNXOVdVNlRBT3pCb1pWUSt4dFNQWFBWeGtDdnJnV1JMUUFwdDBTMVI1?=
 =?utf-8?B?cnNlODFZZ3Z4T2RhTmh6R2ExK0M1VVdEaCtkaldVMkJFeGdOeGRZR24wYXl5?=
 =?utf-8?B?TzYzVFh6MEVUZjdxUkJ3VEpYaXp1ZVJkZXVGVGl5RmJzZkRLZnRBbWw3ODRy?=
 =?utf-8?B?KzdFN3prUS9nM00zRE9IL21valdQODl3UmZQR1c2aWdvN2ZGbm9hSTRBR0oy?=
 =?utf-8?B?MGVGOUpOZnFucVhlZW43elNKZ3dGZnJ2YnVTSEtKSnFYR0VOZmJKM3pMUHp3?=
 =?utf-8?B?MnhSMlV1SHRDbUwyYWNVZFplMnRLMXk0NEhjYmdYazdpYTBLS0hiSEQzTDc4?=
 =?utf-8?B?MUtlS0VsK1dMd1gzcEpoWXBCZjUxZzZZMTl4Uk5IWTZiTXp4dUYwcnU2UjhC?=
 =?utf-8?B?dzVDY2VYWnJtUmNtV2dUS3VqZzZtczlzT0pwU0Q5VS9OaFhxQzlkeUQ5amcr?=
 =?utf-8?B?dzRRT2hPa1NvYVpueXRhL0IvNDZ3czZ2SG15QnJma2pGODlxR0srK20vU2hv?=
 =?utf-8?B?OHVYVmZlc3poNzVFVStWejBRdDkyZUhRMmZ5NkhLL29JRmRYUUVtbzEzR2ty?=
 =?utf-8?B?eDJzdHBKbHNrcnRuOWRtMVBIa2RiM2lzam9NNnR0ZlVBa2NoVFAvTXkxZTZM?=
 =?utf-8?B?TzJiUEcwdkJ4Mk5TMWJNeGNQbE9TZFFmYlp6RmJkYnNwZ3BsY1YwdFNQazli?=
 =?utf-8?B?VVpraWdSK3hRZDQvYzcxTHhsWklCS3p5aEJoRndLS1pzZGI4eXF2TkRNWFZ1?=
 =?utf-8?B?eGx6dlQxVFFtdFFkcENXajlYUDR6SXJzZ25ibUJoL1hwNlNaVTVSako2VG12?=
 =?utf-8?B?SFJwNi9OZXNobWkrSmREVTVrZU4yUENjcEM0bktRcC9HTEY1UGxvZ3NjMzdZ?=
 =?utf-8?B?S0dyZTJLeUNRMUh3THk0SWxkYmg4Y3VTM3QwRFIzNE0yaTc5QTMrVkIxaXdp?=
 =?utf-8?B?VjdnaGFEK3A1eXFOTEFTUHM4VldTckFhY2xMWnhGV2s5bnVEVERUcjhOL2dX?=
 =?utf-8?B?N0t4TlAxWWdkVWxPUTlDUVB3QzVOQmIwdXppbG9XMVdvVmJLZExKTVcyaFNT?=
 =?utf-8?B?ZUNzUW8zTXhBcUEvLy9XcFZzSC94SGIwN0NyS1oxMWdramE1aHlFb1dQS3I0?=
 =?utf-8?B?aXpWUG9Ed1BWN3lTN3VwWWl0M3Q1VXFzYkxaZm0yMDVaZkFLMnFSd0NGWHYr?=
 =?utf-8?B?M2RBcTA4akwzL1oyK3lCeHppZm5XNGFHRUFjb241ajBsMTArdXA4VFRSUnJU?=
 =?utf-8?B?eUJrRThmRTN1N0FHS3NUS2o3NXFZMzFrcW9kQm5IbkVvb0w1QUZYSlAxSzBY?=
 =?utf-8?B?bWJrMU54MHlZMXI4bGhRV2NhR2ErZVd0UzFSL0VqUXI5Qll6eWpFZDhrU0JM?=
 =?utf-8?Q?gnsTJf1E1ept0s2bAo8piCQhjA+PzomVOhuc6DM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fde7176-6e32-4641-171f-08dd9eac57c1
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 12:28:40.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0236


On 2025/5/29 17:13, Thomas Bamelis wrote:
> Hi all,
>
> As seen in the email chain between me, Thomas Petazzoni, Thomas Bonnefille, Chen, and Inoch, it was okay for me to take over the Milk-V Duo S dts development.
> I have been working myself in by getting comfortable with the fsbl, opensbi, u-boot, and previous work on the matter.
> I'm comfortable configuring each of them and building them from source to make my own fip.bin as to get comfortable with the boot process.
>
> Since I invested quite some time (>20 hours) and am moving on to the actual Linux dts, would it be possible to mention that I am working on that in the Wiki?
> Chances are slim, but I wouldn't like to put in all the work and have somebody suddenly submit a patch before I could.
>
> As a side note, I noticed that the DDR size is set to 256MiB for the SG2002, which implies no RTOS is running on the system.
> As such, I will continue along the same line and assume no RTOS is running for the SG2000, unless instructed otherwise.

Thank you Thomas, welcome to contribue to upstream work.

It should be noted that Inochi is currently reorganizing the dts of 
cv18xx (see the dts rework work description on the wiki for details), 
and it is expected to be merged in 6.16, so please develop based on the 
latest version.

