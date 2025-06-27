Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E272E9EBA
	for <sophgo@lists.linux.dev>; Fri, 27 Jun 2025 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041332; cv=none; b=Yt0t6zwC6tkbB4hkN8HWIT1ltzfFsxIaBCn2mz1bmgcJriy92ijtTDD/0GEkYmCHugr68bxfnMXNO+GFWhq+J7y20PPUD/3MjOJKdzUUjcopNl7lhAmRppRTgN0VfxGcuU0HkzSyh+vlO6Mg6m3cuMyVA9BkpiYSQKNV9LQtDRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041332; c=relaxed/simple;
	bh=4DXISltS8p4I+htA6tcQ+fIt3VjfR7ml/pbNKCURfQs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R7hNDs8EtETi1kLiZ1eoGnOZX/gK0oPSAui5ajYTRQOrW/uRuDmrcgaI0wRnP5I/1yu7euN74/spA1+eYgi28i6Vmu0yBwKPecuEpyQYQqzdDAKiwT2LTYaP4Lprwz4zNFid0e2RtBRiNdQyq0lgaRfIoErZmDU7TBV4UDPb5P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpq-0007BZ-Jn; Fri, 27 Jun 2025 18:21:54 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpm-005e59-0I;
	Fri, 27 Jun 2025 18:21:50 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpl-000QYv-3A;
	Fri, 27 Jun 2025 18:21:49 +0200
Message-ID: <e569866ba4a2290b89b5bbd427d5cee71364612d.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Alexander
 Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, Ze
 Huang <huangze@whut.edu.cn>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li
	 <looong.bin@gmail.com>
Date: Fri, 27 Jun 2025 18:21:49 +0200
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: sophgo@lists.linux.dev

On Di, 2025-06-17 at 15:01 +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.

Applied patches 1-2 to reset/next, thanks!

[1/4] dt-bindings: reset: sophgo: Add CV1800B support
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D5a5c61f7ef96
[2/4] reset: simple: add support for Sophgo CV1800B
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D811fe8ad1db9

regards
Philipp
