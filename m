Received: from mail-hk-f13.appia.vip (mail-hk-f13.appia.vip [119.13.88.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323C1426ECA
	for <sophgo@lists.linux.dev>; Thu,  9 Jul 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.13.88.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598515; cv=none; b=a3HhwidYB0FFX4E3NausvFNSuv2TppZHGWuE/ZqDLp2dUEslIEGjgA3asCF8LCJsqtgFR/9r00ZdJE1rWNSTUUDmBWeC1JtrYQsUa8/yUMvZCXSAeW81Un3lJk9UiHgav3FXNZt1pyIl6Sn5xBz+5yq/8FL166Aqf/KE9N1BN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598515; c=relaxed/simple;
	bh=mdhJ4UTcuYNdZoYY7IqTAChOodt0tgrQwgL3KgZGKl8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=glsI9bO+eMC2PAxhSRTVH+XSbQtdunApC5U3G1zBZ0g27zM+JW7kha+Af9UC/s/njAuC3/H057smxg5RDD6iYAi8gSA1b+06Vo4uwm9RSFxbpOdNb2VW7j+ors5Inmz1hNC8wLu7ctOXLW/KM80EQmeNGu8fVGAz2rFwmN5nyvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sophgo.com; spf=pass smtp.mailfrom=sophgo.com; arc=none smtp.client-ip=119.13.88.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sophgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sophgo.com
Received: from mailgw-hk.appia.vip (unknown [189.1.245.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-hk-f13.appia.vip (FangMail) with ESMTPS id 4gwtgN54HDz28fCj
	for <sophgo@lists.linux.dev>; Thu, 09 Jul 2026 19:54:56 +0800 (CST)
Received: from mail-bj-f78.appia.vip (unknown [120.46.82.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailgw-hk.appia.vip (FangMail) with ESMTPS id 4gwtgF0yFMz7xGj
	for <sophgo@lists.linux.dev>; Thu, 09 Jul 2026 19:54:49 +0800 (CST)
Received: from appia.vip (unknown [10.119.65.211])
	by mail-bj-f78.appia.vip (FangMail) with ESMTP id 4gwtg12zT5z7xSH;
	Thu, 09 Jul 2026 19:54:37 +0800 (CST)
Received: from chao.wei$sophgo.com ( [219.142.246.66] ) by
 ajax-webmail-coremail-front-prod-01 (Coremail) ; Thu, 9 Jul 2026 19:54:37
 +0800 (GMT+08:00)
Date: Thu, 9 Jul 2026 19:54:37 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6a2P6LaF?= <chao.wei@sophgo.com>
To: "Chen Wang" <unicorn_wang@outlook.com>
Cc: "Paul Sherman" <shermanpauldylan@gmail.com>,
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: Re: zsbl PR #135: sg2042 bootargs clobber fix
X-Priority: 3
In-Reply-To: <MA5P287MB6080E388CC6CFC501E2461DCFEF02@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
References: <CALGMsBBMpK83=MchYiXj5WMnDQQwNrO9F6_EKQ2hiiynt38=Ag@mail.gmail.com>
 <MA5P287MB6080E388CC6CFC501E2461DCFEF02@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
X-CM-CTRLMSGS: =?B?C4WeiTiH6nJ5xwDR7hwMki1N8jM=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <55fb02c1.643.19f46bad598.Coremail.chao.wei@sophgo.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:00F3CgAnBcr9i09qeYcRAA--.962W
X-CM-SenderInfo: pfkd0hxzhlq25rskw0oofrz/1tbiAgEDAWpOnX4JKwACsm
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CM-DELIVERINFO: =?B?hdQSZ7ut8oxogbuIQo94+tTRMJp67lO/FtLU+DXRMV+AEGcLqtSfA7qq5+E+J5EvVU
	dovT83pNVpT3BfQHw/AOLItL4nRxStj+Tz59orPDHESt9Q5G4U4ih4uJqm/IIvi6aAKQQa
	HmxB/4RwZ3UNkkLsfC4D1Ux2UQu02wRcT8iH4rvq
X-FangMail-Miltered: at fangmail-hkgw.vm with ID 6A4F8C07.001 by FangMail milter!
X-FangMail-Envelope: 1783598089/4gwtgF0yFMz7xGj/6A4F8C07.001/120.46.82.78/[120.46.82.78]/mail-bj-f78.appia.vip/<chao.wei@sophgo.com>
X-TLS: YES
X-ENVELOPE-SENDER: chao.wei@sophgo.com
X-SOURCE-IP: 189.1.245.169 unknown Thu, 09 Jul 2026 19:54:56 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4F8C10.002/4gwtgN54HDz28fCj

SGkgUGF1bCAmIENoZW46CgpZZXMsIGl0IGlzIGEgYnVnLCBJIGhhdmUgbWVyZ2VkIHlvdXIgY2hh
bmdlcy4KVGhhbmtzLgpCeSB0aGUgd2F5LCB6c2JsIGZvbGxvd3MgbGludXgga2VybmVsIGNvZGlu
ZyBndWlkZSBsaW5lLiBTbyB0aGUgbGVhZGluZyBjaGFyYXRlciBzaG91bGQgYmUgXHQgbm90IHNw
YWNlLgoKQ2hhbyBXZWkKMjAyNi0wNy0wOQoKCj4gLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+IOWP
keS7tuS6ujogIkNoZW4gV2FuZyIgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiDlj5HpgIHm
l7bpl7Q6MjAyNi0wNy0wOCAwNzo1MzoyNCAo5pif5pyf5LiJKQo+IOaUtuS7tuS6ujogIlBhdWwg
U2hlcm1hbiIgPHNoZXJtYW5wYXVsZHlsYW5AZ21haWwuY29tPiwgIkNoYW8gV2VpIiA8Y2hhby53
ZWlAc29waGdvLmNvbT4KPiDmioTpgIE6ICJzb3BoZ29AbGlzdHMubGludXguZGV2IiA8c29waGdv
QGxpc3RzLmxpbnV4LmRldj4KPiDkuLvpopg6IFJlOiB6c2JsIFBSICMxMzU6IHNnMjA0MiBib290
YXJncyBjbG9iYmVyIGZpeAo+IAo+IFRoYW5rIHlvdSwgUGF1bC4KPiAKPiBBZGRpbmcgQ2hhbyBm
cm9tIHNvcGhnbyB3aG8gbWF5IGhlbHAgY2hlY2tpbmcgdGhpcy4KPiAKPiBMb29waW5nIHNvcGhn
byBkZXYgbWFpbGxpc3QsIGp1c3QgRllJLgo+IAo+IEhpLCBDaGFvLAo+IAo+IENvdWxkIHlvdSBw
bGVhc2UgaGF2ZSBhIGxvb2s/Cj4gCj4gVGhhbmtzLAo+IAo+IENoZW4KPiAKPiBPbiA3LzgvMjAy
NiA1OjQ3IEFNLCBQYXVsIFNoZXJtYW4gd3JvdGU6Cj4gPiBIaSBDaGVuLAo+ID4KPiA+IFdoaWxl
IHdvcmtpbmcgb24gUENJZSBicmluZ3VwIG9uIG15IE1pbGstViBQaW9uZWVyLCBJIHRyYWNrZWQg
ZG93biBhCj4gPiBidWcgaW4genNibCB3aGVyZSBtb2RpZnlfYm9vdGFyZ3MoKSB1bmNvbmRpdGlv
bmFsbHkgYXBwZW5kcwo+ID4gJ3Jvb3Q9L2Rldi9yYW0wJyB0byB0aGUgRFRCIGNob3Nlbi9ib290
YXJncyBub2RlIGV2ZW4gd2hlbiBubyByYW1mcyBpcwo+ID4gY29uZmlndXJlZC4gVGhpcyBzaWxl
bnRseSBvdmVycmlkZXMgYW55IHJvb3QgZGV2aWNlIGluIHRoZSBEVEIsIGluIG15Cj4gPiBjYXNl
IHRoZSBOVk1lIHJvb3QsIHdpdGggbm8gZGlhZ25vc3RpYyBvdXRwdXQuCj4gPgo+ID4gVGhlIHNn
MjI2MCBwbGF0Zm9ybSBhbHJlYWR5IGhhcyB0aGUgY29ycmVjdCBndWFyZCAoY2ZnLT5yYW1mcy5u
YW1lID09Cj4gPiBOVUxMIGNoZWNrKS4gSSd2ZSBhcHBsaWVkIHRoZSBzYW1lIGZpeCB0byBzZzIw
NDIvcGxhdC5jIGFuZCBvcGVuZWQgYQo+ID4gUFIgYWdhaW5zdCBzb3BoZ28venNibDoKPiA+Cj4g
PiBodHRwczovL2dpdGh1Yi5jb20vc29waGdvL3pzYmwvcHVsbC8xMzUKPiA+Cj4gPiBIYXJkd2Fy
ZS12ZXJpZmllZCBvbiB0aGUgUGlvbmVlciAoNjQtY29yZSwgMTI4R0IgRERSNCkuIFdvdWxkCj4g
PiBhcHByZWNpYXRlIHlvdXIgcmV2aWV3IG9yIGEgcG9pbnRlciB0byB0aGUgcmlnaHQgU29waGdv
IG1haW50YWluZXIgaWYKPiA+IHRoYXQncyBub3QgeW91Lgo+ID4KPiA+IEJlc3QsCj4gPiBQYXVs
Cg==
