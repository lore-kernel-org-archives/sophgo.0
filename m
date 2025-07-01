Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34E13C3F2
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379187; cv=none; b=HVrj9j+pV+DZfrph510Xxxn4E24f+RCvaiQ/b8gW65WOqZ4oTTn8IDIluI58LS0k8Mk/aSXUgpccnUKVUX+kF03peMwyJAc7FwcB9rBSN4+sK1Go1JVKA6KQTfFbXMiGFhYuJ0Yu8mQwuGpvoxaXwsq+r1k5CZkp4i2juoy3zbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379187; c=relaxed/simple;
	bh=9M0xpRMMUDO10GmTj8Q2uDokp5+yvybmx8wNOiGURkY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i7UfuijIAwEK2pbF5hsRT3XXO6mrndiD/iGustRYS9FPPv0XMC7ABCpQC2gRsAHnY0rymlXoXD+/q0iNFPQj85FEQbOd2ChDVKfRfIOJQNs8HPBiFKoKzNcW/Ra4OKhJR9IpTnaAPEuDZj6V+z4SrRhWRGQBjgu+zptfVE/RSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJEN+aP8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJEN+aP8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb5ec407b1so596895666b.1
        for <sophgo@lists.linux.dev>; Tue, 01 Jul 2025 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751379184; x=1751983984; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9M0xpRMMUDO10GmTj8Q2uDokp5+yvybmx8wNOiGURkY=;
        b=kJEN+aP8cSvWFk0PHIBZjpEhHCp/jm1wlWn/i2Oqpb1IF4eXlFcOIbl+lj2wIMBPNH
         TAAO/Eve/HPNS0gxDn4ZyB17E7wXP3tK1SIQM3ZBCQELNVu4FyAAzJgC+30l2CbQPfdO
         etGI5/dF7pfV6AYUjyvHzbmqTLtRyfBri3Dc82sq41lkc9+Zo/78pG7nTPuyvZHjXEH7
         4/YDC8cjDbCWRpxdLNyFzfJ8q0bIslPXsqHjun5y5fNkGqKyWO5HJ7CvtBUVXIgWP3c/
         7QbSnPIRvfHlGpILkCSA1UdDPEkrrATYHBBQbtAIao7dJQfK1LjB3wUCvsXD9M5w39vi
         CGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379184; x=1751983984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9M0xpRMMUDO10GmTj8Q2uDokp5+yvybmx8wNOiGURkY=;
        b=GO0bNy+jVT/2CYbNSuVyWfx00KpX9SO7v3vmyx6zCzeYAVBV/4wU31UDciy7LvdojF
         b0TeUFdkO5myBxigpuSvLaAwgz6xCeuJHblzX7H+T+BSY2qydZB+CRfxRon4kCPKXFPB
         Luf/NhxhvtH6sKVStpOVYGxsIR1IIowEI9hkjIYGis8x1Ee8ZhMvoh9l2X2ReDuv7Z9n
         iAaa7NoXDutxI09kxV5fejHmvzRC54oyp8G4aLhSg0SO6nJFz3cZT2DYKVWE2Z7gRa3P
         u17pixJBhcdgymI3D76bgX0je7+Y7/TDgtIHAGVx3HifjtJfCQNETsaf1o2R0fEfTYSu
         Xh3w==
X-Forwarded-Encrypted: i=1; AJvYcCUdcxMRZRQ+klUHNk5RlN9wkWyMEHft8fLRoUFIpaxRuGxoPWgfvAMKRCKbjTjn5dmP0RmUPjk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIXVy8hjdLK3yT6VrvOzKOs/l4DkZmHp2GPV8pEOW4eQCCuaoe
	9AUM2RMjgpApVPpn0ZAsV1Dijz5jKOyl6m9MdlaN/+IHFyfT0U0TGVqs
X-Gm-Gg: ASbGnct5luaNemSuXYtePk//Bvphc6VtOrVqxNNuQDygcCGYFFtjZUJw9xChkAPbvYT
	rycbi6DuOdVNVZYlfrjNyWKRFOiW9bRGyZv+sGU53a3ek72DOnBy9i3XdUJcRVJ8pt6sKpzNU3N
	p6CE1COvzX+GS+md9LFQJnN+tnVTRiifFIldMW+HOwn/xoQ8q0I08QSoJ+UbbvwA/xsbVhM2bFr
	eUznYt07iQ/uRpDhJdBlbxxcD8xHFYAPZXecIafn8KercihVb53jPBwUp26dmMJ3RPhRNqXzSbs
	uSc7xOsst4iXo4LhUKYE+TmN7jkTy5ijjAWBjUyzekdRueMymVugagNeEq7oDtDLQ/xlDvkI10m
	Da7wdAw==
X-Google-Smtp-Source: AGHT+IF1tB069kz6JY0KWxXptDNGH10wBVEBZiS6dvHv1zIbhdSfAx48xUxQ0wRn7sog+hmz8X53ww==
X-Received: by 2002:a17:906:6a1a:b0:adb:2a66:85bc with SMTP id a640c23a62f3a-ae3500b8e5amr1624415066b.34.1751379183619;
        Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
Received: from giga-mm-8.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b369sm879228866b.3.2025.07.01.07.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
Message-ID: <b986b184f2a29bb549daeff5c84547d64341f796.camel@gmail.com>
Subject: Re: [PATCH net] dt-bindings: net: sophgo,sg2044-dwmac: Drop status
 from the example
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Date: Tue, 01 Jul 2025 16:13:06 +0200
In-Reply-To: <20250701063621.23808-2-krzysztof.kozlowski@linaro.org>
References: <20250701063621.23808-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-07-01 at 08:36 +0200, Krzysztof Kozlowski wrote:
> Examples should be complete and should not have a 'status' property,
> especially a disabled one because this disables the dt_binding_check of
> the example against the schema.=C2=A0 Dropping 'status' property shows
> missing other properties - phy-mode and phy-handle.
>=20
> Fixes: 114508a89ddc ("dt-bindings: net: Add support for Sophgo SG2044 dwm=
ac")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml | 3 =
++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> index 4dd2dc9c678b..8afbd9ebd73f 100644
> --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -80,6 +80,8 @@ examples:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent =3D <&intc>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <296 IRQ_TYPE_LEVEL_H=
IGH>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-names =3D "macirq";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-handle =3D <&phy0>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii-id";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resets =3D <&rst 30>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names =3D "stmmaceth";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snps,multicast-filter-bins =3D <0>;
> @@ -91,7 +93,6 @@ examples:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snps,mtl-rx-config =3D <&gmac0_mtl_r=
x_setup>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snps,mtl-tx-config =3D <&gmac0_mtl_t=
x_setup>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snps,axi-config =3D <&gmac0_stmmac_a=
xi_setup>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "disabled";
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gmac0_mtl_rx_setup: rx-queues-config=
 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snps,rx-queues-to-use =
=3D <8>;

--=20
Alexander Sverdlin.
