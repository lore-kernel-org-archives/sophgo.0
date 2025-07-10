Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFAA95C
	for <sophgo@lists.linux.dev>; Thu, 10 Jul 2025 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752110128; cv=fail; b=Dz1Y8UihyeqqbuKwLSS6fYL0QGbvvLVK2uuJbIJuxxK5/7C0IW62TaK7cHXgkguCLxuE6grvwTRxXErQVCY26UguRjhiulqVbBV5i0eDODKF3WDDNTG5/G8T1s/55PwrddYDZsRaykDyg5OiM78x7HGqpVvn1k+0+yxkLOE5euc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752110128; c=relaxed/simple;
	bh=cEpjMwU51uO5E/UGEh0KxD3+lBGSe7A07buQgam6nvQ=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=KQPCPNGK50Opa6QasmiJFwnR6mrtXhImROtJGzMtF34y/0K2Ob6qVZAufmaLNr7hZtfJBXM2M5olP+tr3GOneZzkKO0v2R+uJJvAq4lMGoDkKhVTTLiVLdpGEjXxHD4BKqEawGr5Fq3TBn4h+4oOJzqlw3ZtrNZkBE6Qs+YQOJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iuqHvo1Z; arc=fail smtp.client-ip=52.103.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iuqHvo1Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6483HpH/ulSpjrsRO+ywmey1g/vAkvAFHpdyoPqNIO192xw7T3Az5SlA3uYHZPdZjKsEhTcdPyocsaQYUHcRCg70xSnC66QJYGzF/+ENBTES3C0iTPBKM/XRkPlBAMqWbvgI+N0xH+o7zQP7RWnyKFOtt36x0M2IlaqE0HCH4TmJi1xpd8MUbQ3pvCsUszUex6hLUd5FCSH/+jRV/D20ws8TAW/dJW0oYXR5HjNI3/bsrXCeTx+j8oV+Ya5YYA6KpyE7SXam/xPhgE9RZNtfzlPl05v1OwuHN5uLK18/jFkGgZegEpcmLSb7NX3fC0uUBN6NowtKapCCB4UAzYQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzMPO3gDwF82XkjJuGpn5BhQsCtyDYbBCjzsK7FknZ8=;
 b=PitdbPmJ25YCXwBVGtSVrdDO4DcOi5cJmDkfnvgzgRX71826CG9gWAaJKYqJ0QlxMrzjz9w06ADZkvH3e5Bfz4hG1DH9WK4HMRBQWIV4s3um5S8dJtrZDc8ZlE2jnXijnmmlDhYMiAzj+PbD/VG8Yju0FzyMu99RKom03ulg2wz7dUcCvhkogt3l5Yjn53zKXSzqjObEcsKUWE8z0YpjW8RP+vyWgMZ2Bcy99F4m01T170A2B0urCopAFLodSrysg98+jVWLK7JEy6GerEDt+BdfqIdHt6RdErXVby15Ijd4M1TdqCwcNPAtyFKKf1fom51mlSCRXwEjtfQ6pDmxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzMPO3gDwF82XkjJuGpn5BhQsCtyDYbBCjzsK7FknZ8=;
 b=iuqHvo1Z01P2oCXveOcj9yHGHXYjBpVzLk+qqHKB2DQUkqOg+D74SV0tmC8q432d3elIkwnNFR9s4phqb8dWEeQrDuCxqQHk77OHAvA0+gNL37HmOL1NociRDQA1nrY2kXcFNMN2BGL2upe8Hl+acmR3XdT6J8pftz4nOWNAb49QqQMOaYbdapOXbgJKpV86qNC3uoLws/b2XBelz11+5YJVQ5Lqbz5Fx7RSfcn+xPBkRiexFQWtpOl5qi7vWZXn7CO8M9YAMty1Z1mbtSShxUaJKM1nCJu6ApbdQTkGQiK7Xw4IsEvZYSEFrjvOWDzwGogvG1kSYCCmoWKqJ7D7tg==
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2aa::8)
 by MAZPR01MB5836.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:67::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 01:15:21 +0000
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c]) by PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c%7]) with mapi id 15.20.8835.018; Thu, 10 Jul 2025
 01:15:21 +0000
Message-ID:
 <PNYPR01MB11171DF7D2099A95BBAA912DFFE48A@PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 10 Jul 2025 09:15:18 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jul/10/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2aa::8)
X-Microsoft-Original-Message-ID:
 <a5a5746d-2b34-443d-9bdd-df2874cdbab2@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PNYPR01MB11171:EE_|MAZPR01MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdde744-4bb3-49f5-330d-08ddbf4f3d45
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|22402599018|15080799012|5072599009|3412199025|440099028|40105399003|4302099013|13041999003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0hlcW4wcWJHYm00dlZLcERRS2h6Qk4wdnJRZUhZNVZQRWtLOGhpaEUwWUFl?=
 =?utf-8?B?dWYzcWRNU1B5S01GMlB2WWdqRnpyRlpaZW9jY0R1QTZuclQvMDZVZ2tkN0li?=
 =?utf-8?B?TkNQOVVraUs5cVZXWWhjMFJVUjJyemNPUmd5NmFVZUFtQkFyYUZBWC9PNHVt?=
 =?utf-8?B?ZVdBN0pVY244V0QzU010OUJBZzhMSUdKQVNrbm5ETVBFbHEvTGVzV0hDdjdr?=
 =?utf-8?B?dGJTL1g3YmdLbkdGZDFrNC96OHQ5SVRVQU5WNFV3dDJubG9pdkdDTWhxM3RS?=
 =?utf-8?B?eTJRSFhWVHJYNnp1dENZK0pnQU5FZFVqaWNXRGtWWENuSkNWeTRlbFQ0SkpP?=
 =?utf-8?B?WWUvMHAwdFlaaWVvWkpCZ3JVTkdOODJudmFSK3VFMjNkd01JeEluSEJCVEkv?=
 =?utf-8?B?UUg1OEs5L3h5MXdKY3lwSGRvV29TcFlhelZ0M2ErM3RGbk5ORjljSUtzdnl4?=
 =?utf-8?B?V3kvMDVNTWNoSWt4SzFLOHh6WFNYNVU0N3pRdUlSLzJXWmJlZ2ZBeFpQRWl2?=
 =?utf-8?B?QVhxNU9tQ0RwOFJ5SnlnYWQrOEswWVBiaXpTZDl5OXNPY0gvL1FWUFpUV2tD?=
 =?utf-8?B?L1RkYjVzOG4zQ3YvWUc1V3hPQjNwWFR1c3N1ZzZlbk40dUhLcXJjOTdjREZq?=
 =?utf-8?B?SkFsanNnbXdnaTgwWTlOWGF2L2NqMkVCcGZtU2NUK3FJcmNSSmp3WkNiYzY5?=
 =?utf-8?B?a2EwQUpIREZWNG5NL3lVZmtmS3hqMFFLck0xckZjYnVscm91OXVUbDJ6eno5?=
 =?utf-8?B?Qjk4ZlV3MzVhRnJySVRtYWNiNXVBdnJtS0lCdlY5S3FOV0ptNzh0SW5SN1l5?=
 =?utf-8?B?OVd3cEx1OEt4RjJFcGNSSzFvZW5vdHByTC9tb0lCU2dka3ZSanBoc0x6MjVo?=
 =?utf-8?B?KzRNcDZhM0FtZW1ocjJyUlUwZ0xsbVFYRHBHV1liQkpzNXV1SVhkMWJPeEZm?=
 =?utf-8?B?SEtIelhUaGVJUmI3RFZHWjBUdmRtbUJSclR4WUJ0TDBGcWVNVDVSSlVQSmhY?=
 =?utf-8?B?NjNNQ3BpMzdURFU2QTFKajhicHFqbWhLcCtuVzltM1BWNi9veVBnRHpVZ0dL?=
 =?utf-8?B?aFltOG5yNU1tQkJYSFJWazZoL1FVTlh3bU5QOENPTnlhaWpNdW9XL1oxZ3Rs?=
 =?utf-8?B?UEkvYlUzcU11VkFOVXVWWUlWSWJlTnJhVlo1Y0d0dmhIMUUvcnlQV0IvbnFk?=
 =?utf-8?B?dG5QdlVMTkpyMnNkK04xZVNlbTFxaTFLTjU1RXdwTDNpYW83QzZuVlpQRTky?=
 =?utf-8?B?eC9NMEY3WXF6NG5yQmJHcDk5b2dvdDNMWWxqT0oydTIvNEF0OU1iU3B0OXhx?=
 =?utf-8?B?YkJXT0FXWlpUSlNNUFVqT0dlei9ObStMd3dqek00Z0U2YjVOMVMybVhNYzVy?=
 =?utf-8?B?QTNxeDRpeDRuOXQveFJ6Q1BmRmRieHp0UmIwMlE0ZGFDdFNETmVnTzBLSU9Z?=
 =?utf-8?B?dDlpUnJlM2thdWplSDlNNDgwaXk1QlRpVlN3b1BTQXFvbWUrR2FrNVFiV21B?=
 =?utf-8?B?cDhyRkFFTlI2Q0NTUzRPenhZcXh0Nmg2RFVrVko1SzRMQURYQlR1VXdYM21s?=
 =?utf-8?Q?/UMrj2B5MSzdOWzkf+L5eBHaPJUV5qle9YM3Hrw9+oEvul?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmRJVHRtc2V5YUk0QytLT1g0K08rMTVjRXYrSTc0VUExN3RLcmVDYzlFVHE2?=
 =?utf-8?B?QmFUNERkR2VWRndxSWZJQ21PRmpXZlpxb0piOFBWMTBlbWFaVC9TNDlGRDFI?=
 =?utf-8?B?dktPNGJIZ090a3pCRVl4UWV3UjdJa2RSRElOcHN5OUhiSWRMNEttaHZzRHJ6?=
 =?utf-8?B?YkxqQnN1eG5UWjJzcWY0YU5wNFVWT3luNWZjbStlQ2NFS2Y3d0MvYmJIVWFh?=
 =?utf-8?B?UVFteUMya3UrbzNrcjV2U2lYUVJLYmk5ZEszZFhQWHIyT00wcWF3Mkp2akxB?=
 =?utf-8?B?c1NxcXQ0OEo1aGZkRHF1TGpxNUhhaDViMFd5WU9jVHdVbmNRNEVua3BDN0di?=
 =?utf-8?B?Wk5EbnlEZXhFVVNZYURLZVRacEtMR2hkMk1OazdyMm9UWitwc0JlVHUvRjUr?=
 =?utf-8?B?ODF2eTkwYTZON3dzWWtua1JXeEVVVVZ1QmVWQWdvc05Jd2czV1VmTVV2dXJs?=
 =?utf-8?B?R2RxWUhsMGdUbEtlZmRMYUdBUlN2TTBuSDlTY25UVVZGT3FGOVp1VDhoNmpF?=
 =?utf-8?B?ZU92aTkvWWthVCtTS3BOTjZMTW1OazRiays3Tzh0L09adEhMaWZ6WjJ0RFA1?=
 =?utf-8?B?dXZFUkR1M1VqNFF3Z0RyVkc4RDdBcnVVSkxFaXk5Z1kwd04yaHFXcmM0elNN?=
 =?utf-8?B?U3ltcWpuZW1NRys0YWZVc0ljVnN0dWdidXJKRU1HWlNBT2kvcHhkUjR4WTZu?=
 =?utf-8?B?N2V5VERpMnlYUUpqQ0srWGNPeFNuakQ0NjNLVjZuY2lFSUFEaDNzVi9hSDhx?=
 =?utf-8?B?eVB0bW11TmxVZU02a1Z3YkNnWXJXV3htQjZwVkNKU0pKLzdla2xXelFKeFg5?=
 =?utf-8?B?RUZwN2FyZnQ1MDBGMkdSTWkwVUdWZEJRaUt0ZzhiREliK253cnR2LzZYY1Ru?=
 =?utf-8?B?Tm51RkQ0WEJzaVlJdHNydUY2OEVINHI3ayt3SGppZUl1MENndW5BalQ0ZnRN?=
 =?utf-8?B?VHdibXZLVFpGc25pS0xLM1ZzZUJyeGhuN0FocWNsQ1dOZktKL3lJNWNrR1kr?=
 =?utf-8?B?SVpxT1lyM3pISytZckd1a2MwRUNGT2VyNXBjelBuMzNrekVyQ0dpNUFyOTM0?=
 =?utf-8?B?QUt5dTZCY2ExanNpaGp1ck80VWhaVkpBeDR5SDhud20zYzVIYmR6SHpFWEdj?=
 =?utf-8?B?VERkVXovY0tUR25vdHpRVFR1SjE2UXUwMUxUMkIyRlY5RUNQcFV6cDBvQnR0?=
 =?utf-8?B?eWpkdGxsR2MzdTBaU0IvTU5vVTFPWDRLaWttYjZTMzhKdGxjVHM3dWJ5NkJ2?=
 =?utf-8?B?SVBvUStHbjJibktDN1ZDN1ZNUUMyaHZMTVFrR0o5OUY3R1E0bllRaDkxY3gx?=
 =?utf-8?B?QVFBVW5UczVFZjZjK0RrcGVWcGx3M002Q24zQmthRUhPT3llcXdMUU8yWUEw?=
 =?utf-8?B?M3V4VzVSVUNINjRRTkROc0JvTzdrNTZza2ZvQWNHdU00S0IwVEhrbnVJeklY?=
 =?utf-8?B?TjM5eGJ4c3JQZDA3bmpvMlJhTU9Pckt0Q1BhWlZtQ05COTVrdCtRMzdQbXBw?=
 =?utf-8?B?Wm1kV2RCM0FPM0h1MUp6Qi84aWIzcC9ocnNrUXVkalJwSzZwekpLZmlGTlJr?=
 =?utf-8?B?NzZieCtELy9odHJLMDBYakFwVy9WeG5EZHQ1TkF3OXphQUJYRzRwUGlUZFlh?=
 =?utf-8?B?RWUrMElzTTE5bDZBQ2tDNW5ZdFN6aHV1VmdMWGgrRmZ6OEtLTDYzZ25vZzFq?=
 =?utf-8?B?NVR6ODhTWTl2NzNjRVJrV0dKUzJobGNqMlZPYW1yRHhUVkNycXA1TlU0c2Fn?=
 =?utf-8?Q?s1owgIGq+Lka36Sekk=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdde744-4bb3-49f5-330d-08ddbf4f3d45
X-MS-Exchange-CrossTenant-AuthSource: PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 01:15:21.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5836

Last updated: Jul/10/2025 @https://github.com/sophgo/linux/wiki

# CV18xx:

- USB phy patchset updated to v5.
- Ehternet drops RFC patch serials and resubmit as two patchsets, one 
for bindings, another for dts.

# SG2042

- Ethernet support is separated into two patchset and updated to v2.
- EVB support is updated to v3.
- Add more sg2042 isa extension support is updated to v3.

# SG2044

- Add PMU support, v1.
- Add ziccrse extension, v1
- srd3-10 board reserves uart0 device, v1

Thanks,

Chen


