Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A44389473
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780301558; cv=none; b=OuttCoLBqUQjX9ylua161GzZ0OHIcnAc4yHA2oavNsWAAzvNGJRawpdA7vT5bpE/veWmfoBRujgPQrFPLAiGCMprpwF3RjvLIiz6ShuNEj+tlKJC3x2Xyss2oF2TmJzQGcXK7pRfDNfMU6Hj/Iic9toC5+YVF0zyKIOSWD1BTtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780301558; c=relaxed/simple;
	bh=kylLGATv0ykSy65kMisgWiJSj9UMi9dbQiF9mlE7V8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpkVlHu1SO0VzxDiqQkjST3aFZmO2nnV4q7+KAySK3p+AM7Yf0gZ8WZuzJcef2eTk6AIdQh/NrplcZ++acnp6ZCny0BALCknaQr1gH4dGFh4kKMgbDwtg7AXOqwd4kuHRzkvEIswRDFkbA0bde0M2emkqNkHpjNgfGd2szqIF2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=t5aaCPsf; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="t5aaCPsf"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4gTRXM0QyGz3ycR;
	Mon, 01 Jun 2026 04:12:35 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1780301555; bh=kylLGATv0ykSy65kMisgWiJSj9UMi9dbQiF9mlE7V8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t5aaCPsfuLMFg+/9E7LRISnqtntqSsTyan2bSsS0E2wduPUJdtA7I3dFpmaoilEYB
	 N1kRDrUyPLbSq0LgZnfo0Z7BaJHZuEsFqBtR9/fiQJqS7f2Yh3ND/mL+N4A+ID4hIY
	 ck7ROf6Q9Q2WfPX+rZdoN+AVBxBgdtDNGIE/2z/I=
Received: by mertle.michael.orlitzky.com (Postfix, from userid 1000)
	id 6EF4E12C349D; Mon, 01 Jun 2026 04:12:34 -0400 (EDT)
Date: Mon, 1 Jun 2026 04:12:34 -0400
From: Michael Orlitzky <michael@orlitzky.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: sophgo@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: SG2042 SATA (DMA?) issues
Message-ID: <ah0-8kN0MWMj2Npt@mertle>
References: <ahu57vcS0oOFmCI9@mertle>
 <ahxOMJqJTqKfY9SI@mertle>
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ahzs8MSmNU7_vsIT@mertle>
 <MA5PR01MB12500AE1ED1AD25C00C4BA706FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ah0rA-c34RLkHWYt@mertle>
 <MA5PR01MB1250071E879EDEC8ED3A29813FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MA5PR01MB1250071E879EDEC8ED3A29813FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>

On 2026-06-01 16:00:04, Chen Wang wrote:
>
> I'm a little confused about what you mean by "newer firmware." Do you
> mean >= 017a5aea or > 017a5aea?
> ...
> Because in your last email you mentioned you discovered the problem
> starting with b379b067.

I have never tried 017a5aea, only b379b067.
