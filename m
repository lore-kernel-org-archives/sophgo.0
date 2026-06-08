Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4162EDD78
	for <sophgo@lists.linux.dev>; Mon,  8 Jun 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920428; cv=none; b=dQ7NI1xjXYwKs8ckTUQpwoh/wDaF5srdOClqeqscrUpa8gD6mHl0uintelvYzk576wEbd/ctUwikTB+QlbTyV230IfhjKdjQD5yfDGfP+5GeriXgAFqhvDGvEMliBNaK0eZxQv6P3BouZPlrjjOU/yy7xoyO2hhpxcRLe89RWwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920428; c=relaxed/simple;
	bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5dgbI8CZq6V6hXJvEHnYldhvdiNpPYoCYWCTsGGYOCVPDwjg9HmVc6u/tRmSDnVhMpSbDLANDN5gd0cmIWHdKQVUS0O6B7Azf1zSlNRKnPPuS4q1HZGnZNzr3LfOUuyQRxWI0Yy0sRlEdmYryCGcgp2osKmA6FB3TT1yQwUP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciXFZ9UB; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciXFZ9UB"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6603d8697d2so4213346d50.0
        for <sophgo@lists.linux.dev>; Mon, 08 Jun 2026 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920426; x=1781525226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
        b=ciXFZ9UBmvZQzcDs801QZ9UOPWBLYYXpXaPxecm9BEkSB3kri7A8MLvc9TO/lTWttT
         FLC5Fh0VUKPqLFbtaU4aAUrSq5k5fVyT6BjcKxHOZ4pCy7FcEd+gEkrUTyP6foQkxoGX
         T82VBQx7gf/+gnJOAVWkE3qbSc7wEYjJxuJqmy8TJdpck4O9jrzJynaB1JsAtRkEkDjU
         REGrhJWCxJNvRiLr06Ocz3kAN2ulhOmlIJwUY3TQyj6NSLVPs1ORPUB4zcWB2IlVW2+d
         MTNYq1z3P/k1wrtrxBiByLxLQsM8BkD9ri2Fy7+MvOnPAKwXxx6Hh6sXJuUXz0cIJ3Kb
         3q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920426; x=1781525226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
        b=rxr4pm5qeKNwO45rvFg6h3ySwRe4QNUUHZ6PHN5yfMw0bNDr7/U+yrhHlidHN8FWdk
         SG2kLinAeOaHA/QMdCPxHRdI2bZFlXt/grO6LQJYoD9lBoVyEsmiRUrdlYwgadAdT2AN
         5mJZUqGWsfDhn9fJnNF4W7ZPjvIgQh/B/CGQvYNE3icC3O6fQ6uVdyVtoqwkOA6DRbxf
         pGX2bDX/kOFlrGeQ7JLjcrIK0K8GOIxQQbz57pu3kYw/Xv95nOsCL/pdnn3hcmY5ZrsS
         HbfbYuUZtC8viYeB87r53EomHEbZpDxA4rV99CoE9uhGEfRv11AdVW0xt9hJcCwFeOUe
         V4KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GKmaCT30wJHRMb9wVYR5AI9wOscyPzAW9ZHrnzX6a9u+xnag9XRVTVo/ZPQdtrQtOWY9w+yM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5yyEFw8mJAoHGlB+Y30JcmQZfnBrhYROeZaMZGsoBZg2bTi6T
	dHGa+3LyQhDzidSE8i03MIT5Aw7Oc3qeTRiUAkmCSc3jNO6DkP76CLlA
X-Gm-Gg: Acq92OHkmo5KYc6Ehi7NxTvZ1nqEYkU+ymXKRvRxeTS6czDROW2JY6NnI/L1F6XscXm
	wkMOnYQI2z8s5vXTRLGw57++seqLeUOrjql0awotHtEh/UkuwnvLxqf6ZLALYSBBVjdanu0ex9i
	VIy/3fwPwfClvEKv50chkrO7dzTWu9/J1GjMZ7BxAM2Mo6o9zbcBpbwzO/qSA4JHygZuxYlyOmg
	KuNEIx/FJS3hPuAA7ACYfXb1DMQ7xDZaW7EQ3bg+WfYdNzxj1WaavrxuU+Y2fpPydH1uq9v/zLN
	0OJ2f19AWwdxjebX7qWIVBTBwPyqx74klOb30XOOpBZ0jyO58JPoEVnLqSLWZeZQ6DoRz17cGwW
	XdFJ6MAYTZbkdJqcYuRPm+U1t8wPWq6szUVMCo+3PkrDn92//jViBtuFNdJoXsjyKmk/tjTQ7Rr
	kMY8s0w/FbapFMlLq7XrY9RQdjpet74iAdJohIfaLfELnMbA6f3Gontl5G24B+UO5RfPA=
X-Received: by 2002:a53:bb91:0:b0:660:eada:ea0e with SMTP id 956f58d0204a3-66106fe6ed4mr10422864d50.39.1780920426381;
        Mon, 08 Jun 2026 05:07:06 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9dfc1sm164019946d6.4.2026.06.08.05.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:07:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:06:59 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Message-ID: <aiawY8BlHlSFXbSJ@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-5-josh.milas@gmail.com>
 <DJ10GDDAE672.1N365YARL5KV1@mailbox.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ10GDDAE672.1N365YARL5KV1@mailbox.org>

Hi Shuwei,

The 256 MB was not intentional and was a holdover from testing. I updated the
DT to use 512 MB of RAM. The issue was only on the riscv side. This will be
fixed in the next patch.

- Joshua Milas
