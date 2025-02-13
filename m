Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952121323A
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441316; cv=none; b=DFuKq5wBtmrcvms2eX5/RsyPpQ33vasdv6dGINuVnE5u1koO7PbJzaWfcnrnM5o19jXbhuFcSt76tB1gb4JyiIwKXvZZ1ocbxbsTiGfx3BnG1J+8DXDezP9yB7pSqu3cLaoY53A7Z/Ok+PBMegm112g0GOfouzwjkLihFMCiD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441316; c=relaxed/simple;
	bh=4nPHH3gdjjhCp0D3T2e0TjZRVtYJvjDIu2hfsqY/WcI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HwGetaF+gN5r/RZiEorXRbtuHIQC7exLFzA1KWVyoXy2QFFBM3kmsskxHY54LTBbnCGmUFK0bSU313qaLDdrEgxoD1uxwVO+kHAv4MF1iDhvB5BS1AyjqQwo+Q+fGX60A6P/BZtTHMGYb+7uyB9oGq8cvwoBDGn9nFeDwZ7NIQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiW8c-00071Z-Dt; Thu, 13 Feb 2025 11:08:06 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiW8Z-000jXZ-2a;
	Thu, 13 Feb 2025 11:08:03 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiW8Z-0002vt-2N;
	Thu, 13 Feb 2025 11:08:03 +0100
Message-ID: <42e8f0e0f065b10fa8731d26acc856e5776fe2de.camel@pengutronix.de>
Subject: Re: [PATCH 0/4] reset: introduct generic bit reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,  Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Date: Thu, 13 Feb 2025 11:08:03 +0100
In-Reply-To: <20250213020900.745551-1-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
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

On Do, 2025-02-13 at 10:08 +0800, Inochi Amaoto wrote:
> Many SoC have a simple reset controller with toggling bit to perform
> assert/deassert. It is annoyed to add compatiable for each device when
> coming a new SoC. It is necessary to introduct a generic device to
> simplify these things.

You'll still have to add a compatible to reset-simple.yaml for each new
SoC, see patch 3.

regards
Philipp
