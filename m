Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADE261568
	for <sophgo@lists.linux.dev>; Fri,  4 Jul 2025 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610883; cv=none; b=s6WQ0dyEazQn8vBR/8qDpGnIEnLaKQ2lax/cgXrwsnSF9ZBBPkNb4gLkHCIVi3cMtIPngcq7xR9SUdERUeNUqzUT9m84ti1BHcJjrCNvGMRu35CPsT0poSAkKML15RQUoYBxKOKFh3O6lUiPmDzyCtHEpnJXQvqgibUSqq4CPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610883; c=relaxed/simple;
	bh=zVR7lBlJEEEeubKMfUP+Rqpd+a2Gj2iVNlm2/FjJRYs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cPmEE+jMhh2uilVLNGa+W+IqH5JQevW+d3zY0OK5c6BWQzC+H0qc9u8nZWCv3vwXKGOZUknTCg28O8+RWIaZbs7BUEvoYpoxG6G7xh3gpphaI/XF3N5dRQ1+vXXAyAsGJgXrK+Yy4k4GI+fBHkeFoyVPLRP0tSS5nq6FPTGnqIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLQ4N6IJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLQ4N6IJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so573485a91.2
        for <sophgo@lists.linux.dev>; Thu, 03 Jul 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751610881; x=1752215681; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYiCNFfJqMeO2073S6siJ3ufZ/e3IN78WfGZjIKg56I=;
        b=aLQ4N6IJbdZbPMDkhaMLtZN+kek5jhlQDiomMX0EXjAA1GaqdmkAyLT3HIKVvU2SS7
         Wm4QpMOpkboFnv6m9KRuoU1oNe/doOPH7yxBDyX0FbNoDLCdYQNIr0xEC2E3NNtXBmZv
         sabfpW+e7YoGL1NgRFRb8vfYlgHIjCEqfb82ObGKtfqT7VMCaWeYnTyrViaCsi99YCu8
         yj3aYrjWBmI1WHIsMpSiZ2Uqbbo051jqhK786i173PPusU+B32Y4cckQ9XdWoMZ8XqzH
         M/OopmI89gzP7JS/Y5KPHKQSkaWcZdOj3jh037DlqfoY6rhoPxZ5psZ0d1J42+Rw3Go0
         8iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610881; x=1752215681;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYiCNFfJqMeO2073S6siJ3ufZ/e3IN78WfGZjIKg56I=;
        b=CIaAgUwW7ECwi/iV8MU20mItJmT+iaO83G2h3u5tfBURW5Df2YBus1Jw6nPfLmg2hn
         fGY48hif2EkzfaSzE8tk/Qy147MkVTql+k0sS0oVbA4QPdkybVCPQXj8v1/mt2phOOiL
         1OluInDHipO8MO8uusD7RgKOnD2evtTacNu6rF7nIBB0hMpP9lg6aKFr86iWx19HKjrf
         7gn1JpKBrZuPQVb44Vlw/oJ5TJf9EHKxfpzI+92NLsZsaTRwHHQQPgZjtiRzXz2FPqnR
         hP3NdGDX7O826FVpgCunUggadGobT0hIdvfLYOZjIDAVWBrFD56w5gpY2f+yv/ChDnaC
         5pMg==
X-Forwarded-Encrypted: i=1; AJvYcCUHOFy3XzMFxHS9Ox/CvRK8VoFofkqSks+IpoEA0m5rEpAiWxeVNeejMTlQD5kt5HCBB8TNZCE=@lists.linux.dev
X-Gm-Message-State: AOJu0YycUuQWnSJwTREIw5jZjBnkCN8QCtFnaJODYz7RdlWDbFSfKHJd
	IGVlF95zmBNZAiTPvkGg49OIaEF5XEqRui9mYfxw8h0Cu/Tv6EZEv/dO
X-Gm-Gg: ASbGncvGzVvR/NKwaYEOD1QtS6JeNUoYx2L5uIip/rw+SfftE8WjsgM1dgvtoLjoVi6
	hUBHvlhgTEcAhPc5NcfytnIiV/M0Cx1KOtC6mOqOTe3qIFqJsm95vmsYOJB2t4E4TOihgRLsgfP
	tDBxYLcCvhE7Z2OHIVfl7uVWsGiZBAtPalg1ciobey8GFzsY9EHulUNHFjBHRBZB+2cZYwJMsYc
	bNodQ2ZyGs/nh1HaGfqcZbLwyxg8cJFWctoWGUPUFokNfQ2EZEG0cg4tQortftwOpa/VX8xIWxn
	WOEV0NgDnM5DhGbtdEUZrEneeVfKoy68C11igSv4rqGAcQ9TAbY9+FG6SEOZPu550AE8XNJUWNG
	GEnXZ
X-Google-Smtp-Source: AGHT+IHEHJgrSAlf4QtYjnnpQojHpV64nqFJPISlrnqx4qrKwtRHYPIo6YcfJzG+LY6E90mpEFUBOA==
X-Received: by 2002:a17:90b:1c07:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-31aac4cf19dmr2508356a91.18.1751610880251;
        Thu, 03 Jul 2025 23:34:40 -0700 (PDT)
Received: from smtpclient.apple ([206.83.106.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc4ca0bsm4159360a91.4.2025.07.03.23.34.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:34:39 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250703004024.85221-1-inochiama@gmail.com>
Date: Fri, 4 Jul 2025 14:34:22 +0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 Longbin Li <looong.bin@gmail.com>,
 devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C7422FE9-1DAF-405C-99B1-1838F2ECE6C1@gmail.com>
References: <20250703004024.85221-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> On Jul 3, 2025, at 08:40, Inochi Amaoto <inochiama@gmail.com> wrote:
>=20
> As the uart0 is already occupied by the firmware, reserve it
> to avoid this port is used by mistake.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts =
b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index 96ccb6120114..1b506972d465 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -113,6 +113,11 @@ &sd {
> 	status =3D "okay";
> };
>=20
> +&uart0 {
> +	/* for firmware */
> +	status =3D "reserved";
> +};
> +
> &uart1 {
> 	status =3D "okay";
> };
> --=20
> 2.50.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

