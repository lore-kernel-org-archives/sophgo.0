Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2E53DF010
	for <sophgo@lists.linux.dev>; Thu,  2 Apr 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125866; cv=pass; b=G/5wD6foZsuXD/likv2Lac0Nw6z7q974whmD0/WTTDrtL0BDTkBKZpBwbUwmfe4g2Gsg4xl3HVzFvNcEC1aCgb2KRuv2iRAOONeUDvLREDgD4zFqRQoXbxGUJymeuAntLoi56JcY1xa9whVkhFmR0JRstOL7P/1mXOWSmZcPt90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125866; c=relaxed/simple;
	bh=MUZx4Y9OyelgL3hyVBr4k6AAzEQS/l7Wd93ZjmObqWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mei17O3QU+3qJioPjn4s5tpLmGnH5Ht9ReozsGV9R4X6B552eL1m+QUJfDQeEi3Oo79pMBkLKJAZeCyiue1pvzW2rj5pfs0VOiUqBGB8zR6RfQonAKVwijsCRqZgmsS+/3Eywj3wOTAnD991ZsnoeGKxsyRkz0o8yJJ9FrHHcuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyteMfhJ; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyteMfhJ"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-953b85a10bbso475288241.3
        for <sophgo@lists.linux.dev>; Thu, 02 Apr 2026 03:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775125863; cv=none;
        d=google.com; s=arc-20240605;
        b=ZaIjEuHXztUM/zY7niBfMn1VLHru4l31JKwDJNlSRbtapmEb8eXpv8XYi/ahlzZuo2
         3U6LG/NgdxtIynQGMnPFjtPGnS6ZVPjyAP3TcPpeCa7dLDu7YxptvU9GitkeUd5ZJkJF
         pwdef0jeLFNlgBp6sDT12fyU3u0zPksdQYDYUTOBLiSlbZHbmmX43+ZrLmxwa+mHTfc5
         6BdaVgdCaBJfxNEiNnToVTB7DNdw++WwJJ0Pv+GdxHgS3EJANAzCGaCf9/rp5Cjl69Ki
         Hw/MqsnzUN8gJqjh6cdpxqJ+ip01+3Ao4LgwcmzFlaENrRTW2Zbau2ztuj9Uk1BFme+n
         PmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        fh=blH9JCdWq2gwIeLBbekLkgbjfM9koN/pQYsduGzeyW0=;
        b=YxpMhPJnh2Cs3Kv6DN/OSECmVP/YYeOEr1itsWbrBGmxvABC1s1IaDnaFaDvcHP9q9
         VkzMJp0BeN/1dDTZ6Ohs6ow7/rf3Hspso0pkST/+8L/u6z9Lbw/ksOX87sVPsuzrX6pl
         6H6UrkRuRtN2EH6MJfaIX80pOO7ic0k8vNGIqupbyn5p12FdMcIsRYkDSlrepi+VfXl1
         dyq2QPbJlmw6HDkr5MsvJfreJn9NDMaRLvfvoXB5cv85wgdWITCVgv3ctmd9QzSTn/Rb
         9/qV8SfC4XE4Er7Yk/xzTujZMuaDvubK81m0+zhWAtzAT3q6PMPHsj5Pw/Mmb/MwxfXy
         QP2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775125863; x=1775730663; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        b=AyteMfhJ2j5BHz2e4eMuZMSJsvkxVdC7OMNwrQQoey3acBPF2KSo5mxpCz8wpd+ufN
         qGbDg25p5EnI8BgBrEbBX+3mR+2VDcDpQGAmb98QHxgSVpPT3o6+6gh9zoqScjh1aO3P
         s1JOSLEXvMb/kCVIboaQxhQj/Srgkf6sDlQN/lJQNN9E0PW6HR1y4CYR2wxrMsNrcyNG
         9ekNVBUzaYbD76ROetmzILnxVD1m9YYfWZEkTj/HW7ENYUpIY966+vNGbsaSSLtFVFd3
         viww4yTISNjWu0R5XrChrjKQ2V30cmG0CiG3yNml3sWslfkKfSHRPD08lfLoTsAc6n3t
         HQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125863; x=1775730663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        b=qVchqOYJHSf40aHHy68n/r2/9M0Zip239R3QEStfBY/Uqmw3jT6+z7n3HcyrHiooaK
         1Nkg7NYJtAqebdKf4wm+7TBoJlAoGZLaBZ9ih+SMG6MIq2RutrEiOk4PpmKYmrLBQ9bh
         efPrpXHd74gzy44IxK7duCn3rI54tTHOfy7N5PPiT8qI3a/x7hElvP1BwEBr/d2m2ZoB
         4ATOHeNLd97YR/MIbN5MIuA4mmAHuh31fc7gkA3714BsBIcVc8vXbZ7qz7/voAmxET9h
         FDHGaIxjEKkRg7eSQjfSm4gmzS6ANHL5oCKK7KtnzHLGOslND152XKVabANRK7SsqhMc
         NchA==
X-Forwarded-Encrypted: i=1; AJvYcCVsY/oEOlKnQBUjuw/MSERMtqyb9MPxUFrZ/4mtkASQgAyeRIUpuNpgT3HswpJNhYni2Irbi6s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6iRvMYJJiQMmTQX5tvqi00v2ZQeUb8lKcRsM0ZiyFeZWmAMzw
	aFARUUI1YVnPHmcoDPsh6SJso3uIdDvfxULvyQZgpHkVAILDnO+u7cNx9JoEGO3UdcZ+KQA1Aq4
	NCxKeB605M9gSI6b8JEhALU/OXTHgnBM=
X-Gm-Gg: ATEYQzw6D/zkA/dD73EjTkiKED7ESCSTtSM72GkyyIGc93wT7Gae3Gje8JMDBLu/3df
	b4MmyaS/k3CZLPKtBPFk7mWj7lnImlW8pFhViz5NUrEUEY1nWf1CkXuZBaXHfet7GFqFEqAB6/n
	NXVzWfsz7hFdAQepUd1j1UgerDd5Nvj4vM2vFFCjgGaItjYBRamyT2KxSaEcZJ56BUgWGTMo7He
	9F+RagF9eaF1S2r9doQqiuceXDRyamup4mQQ+PoJ0KdaNqelf4uQ7acR6z+TH/6veO+5xKNii7W
	pRKw5fzf7ImOxZQvOS+8/+ZeZG2PIBZzy26741k=
X-Received: by 2002:a05:6102:5343:b0:605:17b8:16db with SMTP id
 ada2fe7eead31-605681ba7d8mr2632044137.25.1775125862274; Thu, 02 Apr 2026
 03:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331171248.973014-1-gaohan@iscas.ac.cn> <20260331171248.973014-3-gaohan@iscas.ac.cn>
 <MA5PR01MB12500707BE1C6E11EC3F4B94FFE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB12500707BE1C6E11EC3F4B94FFE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Thu, 2 Apr 2026 18:30:49 +0800
X-Gm-Features: AQROBzCGzBaggmtPSR3_A5qLKsf5xg9SqM3fnlQMsletNH9S6oyqQ5RfqOQtIhM
Message-ID: <CAAT7Ki_BkfYCN_AJtksOEopU2r0iYPybuEQfm+pMLpsm8+EJkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zixian Zeng <sycamoremoon376@gmail.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 4:44=E2=80=AFPM Chen Wang <unicorn_wang@outlook.com>=
 wrote:
>
>
> On 4/1/2026 1:12 AM, Han Gao wrote:
> > SG2042's PCIe root complexes are cache-coherent with the CPU. Mark all
> > four PCIe controller nodes (pcie_rc0 through pcie_rc3) as dma-coherent
> > so the kernel uses coherent DMA mappings instead of non-coherent bounce
> > buffering.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/d=
ts/sophgo/sg2042.dtsi
> > index 9fddf3f0b3b9..3af770549742 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > @@ -417,6 +417,7 @@ pcie_rc0: pcie@7060000000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> > @@ -439,6 +440,7 @@ pcie_rc1: pcie@7060800000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> > @@ -461,6 +463,7 @@ pcie_rc2: pcie@7062000000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> > @@ -483,6 +486,7 @@ pcie_rc3: pcie@7062800000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> For binding changes, LGTM. But I have a question regarding this change
> in dtsi.
>
>  From your patch description, I understand that enabling the
> `dma-coherent` attribute requires upgrading the firmware `fip.bin`. If a
> user only updates the kernel (which is relatively easy) but forgets or
> doesn't know how to upgrade the firmware, enabling `coherent` might
> cause the kernel to skip all explicit cache maintenance operations.
> Could this pose a subtle risk?
>
> Wouldn't it be safer to leave the upstream unchanged in dtsi and allow
> users to add the `dma-coherent` attribute themselves after they upgrade
> the firmware?

In the firmware, fip.bin and devicetree are distributed together.
So matching issues are unlikely.

>
> I would greatly appreciate your guidance.
>
> Thanks,
>
> Chen
>
>

Thanks,
Han
